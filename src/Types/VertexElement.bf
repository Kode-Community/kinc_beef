using System;
using kinc_beef.Enums;

namespace kinc_beef.Types
{
	[CRepr]
	struct VertexElement
	{
		char8* name;
		VertexData data;
	}
}
