   M S B A M L   `   `   `  ����N  JComponentClassifier, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:ComponentClassifierComponentClassifier  5   	   O,clr-namespace:ComponentClassifier.ViewModelsComponentClassifier.ViewModels  5   	   U QLiveCharts.Wpf, Version=0.9.7.0, Culture=neutral, PublicKeyToken=0bc1f845d1ebb8dfG4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.WpfLiveCharts.Wpf 5   	   $    ComponentClassifier.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   3local!clr-namespace:ComponentClassifier     5   	   ;vm,clr-namespace:ComponentClassifier.ViewModels     5   	   Dlvc4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.Wpf     5   	     � Title$$  Component Classifier Dashboard��5
   	   $	��800��60   $
��1280��6=    � DataContext 5      2   ,ComponentClassifier.ViewModels.MainViewModel  5   
   .��5      � $��10q�6   .+�5   
   �� .@�5      �� $��Results��6   .��5      &   System.Windows.Controls.DataGrid     AutoGenerateColumns$ False��5         
IsReadOnly$
 True��5         CanUserAddRows$ False��5         AlternatingRowBackground �#f0f8ff$��14(�5      ��5      �� *ClassifiedReadings+   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ 	Timestamp��6-      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6^   1  +System.Windows.Controls.DataGridBoundColumn	   Binding	 6@   �� *	TimeStamp+6^     5      $ 	Component��6-   $ * 6^   	 6@   �� *	Component+6^     5      $
 Type��6-   $ * 6T   	 6;   �� *Type+6T     5      $ Fault %��6-   $
 Auto 6X   	 6>   �� *Fault+6X     5      $ Result��6-   $ * 6X   	 6=   �� *Result+
   ElementStyle
 5       �� 5!   "    �� 
TargetType" ��6(   .�5"   &   ��  �� Property � �� �� Value$
 Bold"�6C    �� Triggers 5#   &   �� 5$   *    �� Binding 66   �� *Result+ �� Value PASS6Q   .a�5%   .   ��  � ��
 � � �6K   5&   +   �� 5'   *    66   �� *Result+ INSPECT6Q   .a�5(   .   ��  � ��
 � ���6K   5)   +   �� 5*   *    66   �� *Result+ FAIL6Q   .a�5+   .   ��  � ��
 �  ��6K   5,   +   5.   #   50      52      53      �� 56      $��	Dashboard��6   .��57      �  � RowDefinitions 58      �� 59      $
��Auto �6(   �� 5:      $��* �6(   .+�5>      �� $��0��6   
�������$��1q�6B    �� Padding$ 15q�6V   $��5q�6c    �� CornerRadius$ 5��6n   ._�5?      �  � ColumnDefinitions 5@      �� 5A   "   $��* �63   �� 5B   "   $��* �63   �� 5C   "   $��* �63   �� 5D   "   $��* �63    5F      �� 5G   "   $
��Auto �60   �� 5H   "   $
��Auto �60   .+�5L      �� $��0��6)   $��0��66   $��Center=�6F   $��Center=�6c   $��5q�6~   .+�5M   "   �� $��Total Components Fed��6,   $��14(�6H   
�������6V   �� 5N   "   $��28(�6P   $
��Bold"�6^   $��Center=�6p   ��6,   �� *TotalComponentsFed+6p   5O      �� 5P      $��0��6)   $��1��66   $��Center=�6F   $��Center=�6c   $��5q�6~   .+�5Q   "   �� $��Total Faults Detected��6,   $��14(�6I   
�������6W   �� 5R   "   $��28(�6Q   $
��Bold"�6_   
��� ���$��Center=�6�   ��6,   �� *TotalFaultsDetected+6�   5S      �� 5T      $��0��6)   $��2��66   $��Center=�6F   $��Center=�6c   $��5q�6~   .+�5U   "   �� $��Needs Inspection / Faulty��6,   $��14(�6M   
�������6[   �� 5V   "    �� Orientation$ 
Horizontal=�6-   $��Center=�6F   .+�5W   &   �� $��28(�6P   $
��Bold"�6^   
��� �����60   �� *NeedInspection+6p   �� 5X   &   $	�� / ��60   $��28(�6;   $��Light"�6I   $��Center=�6\   �� 5Y   &   $��28(�6H   $
��Bold"�6V   
���  ����60   �� *Faulty+6h   5Z   #   5[      �� 5\      $��0��6)   $��3��66   $��Center=�6F   $��Center=�6c   $��5q�6~   .+�5]   "   �� $��Result Distribution��6,   $��14(�6G   
�������$��Center=�6g   � 5^   "   $��0,5,0,0q�6'    5_   &   �� 5`   *   $
��Auto �6;   �� 5a   *   $
��Auto �6;    5c   &   �� 5d   *   �� 5e   *   �� 5f   *   .+�5h   &   �� $��0��60   $��0��6=   $��Pass:��6M   $��SemiBold"�6Z   
��� d �$��0,0,8,0q�6�   �� 5i   &   $��0��60   $��1��6=   $
��Bold"�6m   
��� d ���6M   �� *PassPercentage+6   �� 5j   &   $��1��60   $��0��6=   $��Inspect:��6M   $��SemiBold"�6]   
��� ���$��0,0,8,0q�6�   �� 5k   &   $��1��60   $��1��6=   $
��Bold"�6p   
��� �����6M   �� *InspectPercentage+6�   �� 5l   &   $��2��60   $��0��6=   $��Fail:��6M   $��SemiBold"�6Z   
���  ��$��0,0,8,0q�6�   �� 5m   &   $��2��60   $��1��6=   $
��Bold"�6m   
���  ����6M   �� *FailPercentage+6   5n   #   5o      �� 5r      $��1��6)   $��0��66   $��Center=�6F   $��Center=�6c   $��5,15,5,5q�6~   .+�5s   "   �� $��Nuts Fed��6,   $��14(�6<   
�������6J   �� 5t   "   $��28(�6E   $
��Bold"�6S   $��Center=�6e   ��6,   �� *	NutsFed+6e   5u      �� 5v      $��1��6)   $��1��66   $��Center=�6F   $��Center=�6c   $��5,15,5,5q�6~   .+�5w   "   �� $��Fasteners Fed��6,   $��14(�6A   
�������6O   �� 5x   "   $��28(�6J   $
��Bold"�6X   $��Center=�6j   ��6,   �� *FastenersFed+6j   5y      �� 5z      $��1��6)   $��2��66   $��Center=�6F   $��Center=�6c   $��5,15,5,5q�6~   .+�5{   "   �� $��Faults in Nuts��6,   $��14(�6B   
�������6P   �� 5|   "   $��28(�6J   $
��Bold"�6X   
���E��$��Center=�6�   ��6,   �� *FaultsInNuts+6�   5}      �� 5~      $��1��6)   $��3��66   $��Center=�6F   $��Center=�6c   $��5,15,5,5q�6~   .+�5   "   �� $��Faults in Fasteners��6,   $��14(�6G   
�������6U   �� 5�   "   $��28(�6O   $
��Bold"�6]   
���E��$��Center=�6�   ��6,   �� *FaultsInFasteners+6�   5�      5�      5�      � 5�      $��1��6   $��5q�6(    5�      �� 5�      $
��1.2* �6/   �� 5�      $
��0.8* �6/    5�      �� 5�      $��* �6,   �� 5�      $��* �6,   .+�5�      �� $��0��6!   $��0��6.   $��2��6>   
�������$��1q�6g   $ 10q�6{   $��5q�6�   $ 5��6�   ._�5�      #  LiveCharts.Wpf.CartesianChart  &   LiveCharts.Wpf.Charts.Base.Chart   LegendLocation$	 Top=�6Z      Series 61   �� *FaultsLineChartSeries+   AxisX 5�   &   	  LiveCharts.Wpf.Axis	   	  Title$ 	Timestamp��6/    	  Labels 6A   �� *FaultsLineChartLabels+   AxisY 5�   &   	  $ Fault Percentage��6/    	  MinValue$ 0Q�6H    	  MaxValue$	 100Q�6U   5�      5�      �� 5�      $��0��6!   $��1��6.   
�������$��1q�6V   $ 10q�6j   $��5q�6w   $ 5��6�   ._�5�      
  LiveCharts.Wpf.PieChart
  $ Bottom=�6S      	Hoverable$
 True��6k    6+   �� *ResultPieChartSeries+   DataTooltip 6|   Z�     ChartLegend  5�   "   "  LiveCharts.Wpf.DefaultLegend  5�   &   !   
BulletSize$! 20Q�68   5�      5�      �� 5�      $��1��6!   $��1��6.   
�������$��1q�6V   $ 10q�6j   $��5q�6w   $ 5��6�   ._�5�        $	 Top=�6W    61   �� *TypeBarChartSeries+ 5�   &   	  $ Component Type��6/    6F   �� *TypeBarChartLabels+ 5�   &   	  $ Number of Faulty Parts��6/   " 	  LabelFormatter" 6N   �� *Value+# �� StringFormat$# {0:N0}��5�      5�      5�      5�      5�      5�      5�      5�      