/*
class: SYSTEMTIME
This class represents a SYSTEMTIME struct.
The FILETIME structure specifies a date and time, using individual members for the month, day, year, weekday, hour, minute, second, and millisecond. The time is either in coordinated universal time (UTC) or local time, depending on the function that is being called.

Remarks:
	The structure is initialized with the current date and time when an instance is created from scratch.
*/
class SYSTEMTIME
{
	/*
	Field: wYear
	The year. The valid values for this member are 1601 through 30827. Defaults to the current year.
	*/
	wYear := A_YEAR

	/*
	Field: wMonth
	The month. This member can be a number from 1 (January) to 12 (December). Defaults to current month.
	*/
	wMonth := A_MM

	/*
	Field: wDayOfWeek
	The day of the week. This member can be a number from 0 (Sunday) to 6 (Saturday). Defaults to current weekday.
	*/
	wDayOfWeek := A_WDAY - 1

	/*
	Field: wDay
	The day of the month. The valid values for this member are 1 through 31. Defaults to current date.
	*/
	wDay := A_DD

	/*
	Field: wHour
	The hour. The valid values for this member are 0 through 23. Defaults to current time.
	*/
	wHour := A_HOUR

	/*
	Field: wMinute
	The minute. The valid values for this member are 0 through 59. Defaults to current time.
	*/
	wMinute := A_MIN

	/*
	Field: wSecond
	The second. The valid values for this member are 0 through 59. Defaults to current time.
	*/
	wSecond := A_SEC

	/*
	Field: wMilliseconds
	The millisecond. The valid values for this member are 0 through 999.
	*/
	wMilliseconds := A_MSEC

	/*
	Method: ToStructPtr
	converts the instance to a script-usable struct and returns its memory adress.

	Parameters:
		[opt] UPTR ptr - the fixed memory address to copy the struct to.

	Returns:
		UPTR ptr - a pointer to the struct in memory
	*/
	ToStructPtr(ptr = 0)
	{
		static struct

		if (!ptr)
		{
			VarSetCapacity(struct, 16, 0)
			ptr := &struct
		}

		NumPut(this.wYear,			1*ptr,	00,	"short")
		NumPut(this.wMonth,			1*ptr,	02,	"short")
		NumPut(this.wDayOfWeek,		1*ptr,	04,	"short")
		NumPut(this.wDay,			1*ptr,	06,	"short")
		NumPut(this.wHour,			1*ptr,	08,	"short")
		NumPut(this.wMinute,		1*ptr,	10,	"short")
		NumPut(this.wSecond,		1*ptr,	12,	"short")
		NumPut(this.wMilliseconds,	1*ptr,	14,	"short")

		return ptr
	}

	/*
	Method: FromStructPtr
	(static) method that converts a script-usable struct into a new instance of the class

	Parameters:
		UPTR ptr - a pointer to a SYSTEMTIME struct in memory

	Returns:
		SYSTEMTIME instance - the new SYSTEMTIME instance
	*/
	FromStructPtr(ptr)
	{
		instance := new SYSTEMTIME()

		instance.wYear			:= NumGet(1*ptr,	00, "short")
		instance.wMonth			:= NumGet(1*ptr,	02,	"short")
		instance.wDayOfWeek		:= NumGet(1*ptr,	04, "short")
		instance.wDay			:= NumGet(1*ptr,	06,	"short")
		instance.wHour			:= NumGet(1*ptr,	08,	"short")
		instance.wMinute		:= NumGet(1*ptr,	10,	"short")
		instance.wSecond		:= NumGet(1*ptr,	12,	"short")
		instance.wMilliseconds	:= NumGet(1*ptr,	14,	"short")

		return instance
	}

	/*
	Method: FromFILETIME
	(static) method that converts a FILETIME instance to a SYSTEMTIME instance

	Parameters:
		FILETIME src - the FILETIME instance to convert

	Returns:
		SYSTEMTIME instance - the new SYSTEMTIME instance
	*/
	FromFILETIME(src)
	{
		if (IsObject(src))
			src := src.ToStructPtr()
		VarSetCapacity(dest, 16, 0)
		DllCall("FileTimeToSystemTime", "ptr", src, "ptr", &dest)
		return SYSTEMTIME.FromStructPtr(dest)
	}
}