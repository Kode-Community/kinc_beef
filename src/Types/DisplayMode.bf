using System;

namespace kinc_beef.Types
{
	[CRepr]
	struct DisplayMode   {
		int32 x;
		int32 y;
		int32 width;
		int32 height;
		int32 pixels_per_inch;
		int32 frequency;
		int32 bits_per_pixel;
	}
}
