using System;
using kinc_beef.Enums;

namespace kinc_beef.Types
{
	[CRepr]
	struct VrPosState
	{
		VrPose vr_pos;
		Vector3 angular_velocity;
		Vector3 linear_velocity;
		Vector3 angular_acceleration;
		Vector3 linearAcceleration;

		TrackedDevice tracked_device;

		bool is_visible;
		bool hmd_presenting;
		bool hmd_mounted;
		bool display_lost;
		bool should_quit;
		bool should_recenter;
	}
}
