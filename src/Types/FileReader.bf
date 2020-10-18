using System;

namespace kinc_beef.Types
{
	// there is a lot of crossplatform code (switch, sony, android)
	// I didn't port it :)
	[CRepr]
	struct FileReader
	{
		void* file;
		int32 size;
		int32 type;
		int32 mode;
		int32 mounted;
	}
}
