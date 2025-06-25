using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Windows;
using CommunityToolkit.Mvvm.ComponentModel;
using ComponentClassifier.Models;
using LiveCharts;
using LiveCharts.Wpf;
using Newtonsoft.Json;
using System;
using System.Globalization;

namespace ComponentClassifier.ViewModels
{
    public partial class MainViewModel : ObservableObject
    {
        // Collection for the "Results" tab's DataGrid
        [ObservableProperty]
        private ObservableCollection<Reading> _classifiedReadings = new();

        // --- Dashboard Summary Properties (UPDATED) ---
        [ObservableProperty] private int _totalComponentsFed;
        [ObservableProperty] private int _totalFaultsDetected; // INSPECT + FAIL
        [ObservableProperty] private int _needInspection; // count of INSPECT
        [ObservableProperty] private int _faulty; // count of FAIL
        [ObservableProperty] private string _passPercentage;
        [ObservableProperty] private string _inspectPercentage;
        [ObservableProperty] private string _failPercentage;

        // New properties for detailed type statistics
        [ObservableProperty] private int _nutsFed;
        [ObservableProperty] private int _fastenersFed;
        [ObservableProperty] private int _faultsInNuts;
        [ObservableProperty] private int _faultsInFasteners;


        // --- Chart Data Properties (Unchanged) ---
        [ObservableProperty] private SeriesCollection _resultPieChartSeries;
        [ObservableProperty] private SeriesCollection _typeBarChartSeries;
        [ObservableProperty] private string[] _typeBarChartLabels;
        [ObservableProperty] private SeriesCollection _faultsLineChartSeries;
        [ObservableProperty] private string[] _faultsLineChartLabels;

        public MainViewModel()
        {
            LoadAndProcessData();
        }

        private void LoadAndProcessData()
        {
            // (Steps 1 and 2: Loading and Classification are unchanged)
            var rawReadings = new List<Reading>();
            try
            {
                var jsonText = File.ReadAllText("Readings.json");
                rawReadings = JsonConvert.DeserializeObject<List<Reading>>(jsonText);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error reading or parsing Readings.json: {ex.Message}");
                return;
            }

            var nuts = new HashSet<string> { "HexNut", "CapNut", "WingNut", "AcornNut" };
            var fasteners = new HashSet<string> { "HexBolt", "MachineScrew", "FlatScrew", "WoodScrew" };
            var processedReadings = new List<Reading>();

            foreach (var reading in rawReadings)
            {
                if (reading.Fault < 7) reading.Result = "PASS";
                else if (reading.Fault >= 7 && reading.Fault <= 30) reading.Result = "INSPECT";
                else reading.Result = "FAIL";

                if (nuts.Contains(reading.Component)) reading.Type = "Nuts";
                else if (fasteners.Contains(reading.Component)) reading.Type = "Fasteners";
                else reading.Type = "Unknown";

                processedReadings.Add(reading);
            }

            processedReadings = processedReadings.OrderBy(r => DateTime.ParseExact(r.TimeStamp, "ddMMyyyy-HHmmss", CultureInfo.InvariantCulture)).ToList();
            ClassifiedReadings = new ObservableCollection<Reading>(processedReadings);

            // 3. Calculate all metrics for the dashboard (UPDATED)
            CalculateDashboardMetrics(processedReadings);

            // 4. Prepare data collections for the charts (Unchanged)
            PrepareChartData(processedReadings);
        }

        private void CalculateDashboardMetrics(List<Reading> readings)
        {
            TotalComponentsFed = readings.Count;

            // General counts
            var passCount = readings.Count(r => r.Result == "PASS");
            NeedInspection = readings.Count(r => r.Result == "INSPECT");
            Faulty = readings.Count(r => r.Result == "FAIL");
            TotalFaultsDetected = NeedInspection + Faulty;

            // General percentages
            if (TotalComponentsFed > 0)
            {
                PassPercentage = $"{(double)passCount / TotalComponentsFed:P2}";
                InspectPercentage = $"{(double)NeedInspection / TotalComponentsFed:P2}";
                FailPercentage = $"{(double)Faulty / TotalComponentsFed:P2}";
            }
            else
            {
                PassPercentage = "0.00%";
                InspectPercentage = "0.00%";
                FailPercentage = "0.00%";
            }

            // Calculate new detailed type statistics
            NutsFed = readings.Count(r => r.Type == "Nuts");
            FastenersFed = readings.Count(r => r.Type == "Fasteners");
            FaultsInNuts = readings.Count(r => r.Type == "Nuts" && r.Result != "PASS");
            FaultsInFasteners = readings.Count(r => r.Type == "Fasteners" && r.Result != "PASS");
        }

        private void PrepareChartData(List<Reading> readings)
        {
            // This method remains unchanged
            ResultPieChartSeries = new SeriesCollection
            {
                new PieSeries { Title = "PASS", Values = new ChartValues<int> { readings.Count(r => r.Result == "PASS") }, DataLabels = true },
                new PieSeries { Title = "INSPECT", Values = new ChartValues<int> { readings.Count(r => r.Result == "INSPECT") }, DataLabels = true },
                new PieSeries { Title = "FAIL", Values = new ChartValues<int> { readings.Count(r => r.Result == "FAIL") }, DataLabels = true }
            };

            TypeBarChartLabels = new[] { "Nuts", "Fasteners" };
            TypeBarChartSeries = new SeriesCollection
            {
                new ColumnSeries
                {
                    Title = "Faulty Components",
                    Values = new ChartValues<int>
                    {
                        readings.Count(r => r.Type == "Nuts" && r.Result != "PASS"),
                        readings.Count(r => r.Type == "Fasteners" && r.Result != "PASS")
                    }
                }
            };

            FaultsLineChartSeries = new SeriesCollection
            {
                new LineSeries
                {
                    Title = "Fault %",
                    Values = new ChartValues<double>(readings.Select(r => r.Fault))
                }
            };
            FaultsLineChartLabels = readings.Select(r => DateTime.ParseExact(r.TimeStamp, "ddMMyyyy-HHmmss", CultureInfo.InvariantCulture).ToString("g")).ToArray();
        }
    }
}
