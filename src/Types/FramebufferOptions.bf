using System;

namespace kinc_beef.Types
{
	[CRepr]
	public struct FramebufferOptions  {
		int32 frequency;
		bool vertical_sync;
		int32 color_bits;
		int32 depth_bits;
		int32 stencil_bits;
		int32 samples_per_pixel;
	}
}
