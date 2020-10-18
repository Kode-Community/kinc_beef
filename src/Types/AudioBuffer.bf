using System;

namespace kinc_beef.Types
{
	[CRepr]
	struct AudioBuffer {
		AudioBufferFormat format;
		uint8* data;
		int32 data_size;
		int32 read_location;
		int32 write_location;
	}
}
