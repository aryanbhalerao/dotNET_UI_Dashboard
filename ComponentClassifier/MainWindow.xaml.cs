// MainWindow.xaml.cs
using System.Windows;

namespace ComponentClassifier
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            // The DataContext is now set entirely in XAML, so no C# code is needed here.
        }
    }
}