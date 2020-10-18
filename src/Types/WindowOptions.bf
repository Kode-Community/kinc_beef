using System;
using kinc_beef.Enums;

namespace kinc_beef.Types
{
	[CRepr]
	public struct  WindowOptions {
		char8* title;

		int32 x;
		int32 y;
		int32 width;
		int32 height;
		int32 display_index;

		bool visible;
		int32 window_features;
		WindowMode mode;
	}
}
