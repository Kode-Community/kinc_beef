using System;
using kinc_beef.Enums;

namespace kinc_beef.Types
{
	[CRepr]
	public struct  WindowOptions {
		char8* title;

		int x;
		int y;
		int width;
		int height;
		int display_index;

		bool visible;
		int window_features;
		WindowMode mode;
	}
}
