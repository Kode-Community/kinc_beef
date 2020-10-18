using System;

namespace kinc_beef.Types
{
	[CRepr]
	struct FileWriter
	{
		void* file;
		char8* filename;
		bool mounted;
	}
}
