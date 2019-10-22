# Photo to G-code

Name of the software	draw2cad

Developer's name	Rishabh Bajpai

Version			v2.0


This is a complete tool for 

	1. Dimension extraction from engineering file
	2. Noise cancellation
	3. Skeletonisation
	4. Vectorisation
	5. G-code generation (currently only for milling) from an image of engineering drawing


How to use

	1. Open source file folder "draw2cad"
	2. Open "draw2cad.m" in Matlab
	3. Run it
	4. click on the upload button
	5. Select ED and click on open (sample ED are 60,61, 62 and line_circle_image5)
	6. click on next
	7. click on extract dimensions button
	8. click next
	9. click on noise reduction
	10.click on next
	11.click on skeletonisation
	12.click on next
	13.click on Scan
	14.wait
	15.Click on add dimensions
	16.Fill values of any dimension from the dimensions' image by using 'data point', in the area 'X1', 'X2', 'Y1', 'Y2' and then fill the real value written in the ED in the field 'real value'.
	17.Click on the add button
	18.Select method on vectorisation from the menu list
	19.Click on G-code button to save it on the hard disk
	20.Enjoy!!!


Compatibility details

	1. Matlab 2016, *64 bit
	2. Resolution 1920*1080
	3. ED from SolidWorks (the software will perfectly work on any ED, but currently it is made for SolidWorks only)

Limited features

	Some features are kept limited to improve the performance, for enabling these feature, more computations are required
	1. highly complex ED

Copywrite issue

	The software is only for education/research purpose, it is not allowed to modify, add or delete any files for any other purpose
