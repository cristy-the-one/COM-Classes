/*
class: LIBFLAGS
an enumeration class that defines flags that apply to type libraries.

Authors:
	- maul.esel (https://github.com/maul-esel)

License:
	- *LGPL* (http://www.gnu.org/licenses/lpgl-2.1.txt)

Documentation:
	- *class documentation* (http://maul-esel.github.com/COM-Classes/AHK_Lv1.1/LIBFLAGS)
	- *msdn* (http://msdn.microsoft.com/en-us/library/windows/desktop/ms221149%28v=VS.85%29.aspx)

Requirements:
	AutoHotkey - AHK_L v1.1+
	OS - (unknown)
*/
class LIBFLAGS
{
	/*
	Field: FRESTRICTED
	The type library is restricted, and should not be displayed to users.
	*/
	static FRESTRICTED := 1

	/*
	Field: FCONTROL
	The type library describes controls, and should not be displayed in type browsers intended for nonvisual objects.
	*/
	static FCONTROL := 2

	/*
	Field: FHIDDEN
	The type library should not be displayed to users, although its use is not restricted. Should be used by controls. Hosts should create a new type library that wraps the control with extended properties.
	*/
	static FHIDDEN := 4

	/*
	Field: FHASDISKIMAGE
	_to be defined_
	*/
	static FHASDISKIMAGE := 8
}