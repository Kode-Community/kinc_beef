using System;

namespace kinc_beef.Types
{
	[CRepr]
	struct AudioBufferFormat {
		int32 channels;
		int32 samples_per_second;
		int32 bits_per_sample;
	}
}
