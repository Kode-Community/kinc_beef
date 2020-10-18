using System;
using kinc_beef.Enums;

namespace kinc_beef.Types
{
	[CRepr]
	struct Image  {
		int32 width;
		int32 height;
		int32 depth;
		ImageFormat format;
		uint32 internal_format;
		ImageCompression compression;
		void* data;
		int32 data_size;
	}
}
