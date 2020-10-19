using System;

namespace kinc_beef.Types
{
	[CRepr]
	struct Pipeline {
		VertexStructure*[16] input_layout;
		/*struct kinc_g4_shader *vertex_shader;
		struct kinc_g4_shader *fragment_shader;
		struct kinc_g4_shader *geometry_shader;
		struct kinc_g4_shader *tessellation_control_shader;
		struct kinc_g4_shader *tessellation_evaluation_shader;

		kinc_g4_cull_mode_t cull_mode;

		bool depth_write;
		kinc_g4_compare_mode_t depth_mode;

		kinc_g4_compare_mode_t stencil_mode;
		kinc_g4_stencil_action_t stencil_both_pass;
		kinc_g4_stencil_action_t stencil_depth_fail;
		kinc_g4_stencil_action_t stencil_fail;
		int stencil_reference_value;
		int stencil_read_mask;
		int stencil_write_mask;

		// One, Zero deactivates blending
		kinc_g4_blending_operation_t blend_source;
		kinc_g4_blending_operation_t blend_destination;
		// BlendingOperation blendOperation;
		kinc_g4_blending_operation_t alpha_blend_source;
		kinc_g4_blending_operation_t alpha_blend_destination;
		// BlendingOperation alphaBlendOperation;

		bool color_write_mask_red[8]; // Per render target
		bool color_write_mask_green[8];
		bool color_write_mask_blue[8];
		bool color_write_mask_alpha[8];

		int color_attachment_count;
		kinc_g4_render_target_format_t color_attachment[8];

		int depth_attachment_bits;
		int stencil_attachment_bits;

		bool conservative_rasterization;

		kinc_g4_pipeline_impl_t impl;*/
	}
}
