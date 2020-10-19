using System;

namespace kinc_beef.Types
{
	[CRepr]
	struct VertexStructure
	{
		//KINC_G4_MAX_VERTEX_ELEMENTS = 16;
		VertexElement[16] elements;
		int size;
		bool instanced;
	}
}
