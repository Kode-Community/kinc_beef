using System;

namespace kinc_beef.Types
{
	[CRepr]
	struct VrPose
	{
		Quaternion orientation;
		Vector3 position;

		Matrix4x4 eye;
		Matrix4x4 projection;

		float left;
		float right;
		float bottom;
		float top;
	}
}
