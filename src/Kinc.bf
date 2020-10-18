using System;

using System.Interop;

using kinc_beef.Types;
using kinc_beef.Enums;

namespace kinc_beef
{
	class Kinc
	{
		// Used by
		// DllImport to load the native library.
		public const char8* nativeLibName = "Kinc_D3D11";

		typealias Size_t = uint32;
		// -----------------------------------------------------------------------------
		//
		// system.h
		//
		// -----------------------------------------------------------------------------

		[LinkName("kinc_init")]
		public static extern int32 init(char8* title,int32 width, int32 height,Nullable<WindowOptions> window_options, Nullable<FramebufferOptions> fo );
		[LinkName("kinc_application_name")]
		public static extern char8* application_name();
		[LinkName("kinc_set_application_name")]
		public static extern void set_application_name(char8* name);
		[LinkName("kinc_width")]
		public static extern int32 width();
		[LinkName("kinc_height")]
		public static extern int32 height();

		[LinkName("kinc_internal_handle_messages")]
		public static extern bool internal_handle_messages();
		[LinkName("kinc_load_url")]
		public static extern void load_url(char8* url);
		[LinkName("kinc_system_id")]
		public static extern char8* system_id();
		[LinkName("kinc_internal_save_path")]
		public static extern char8* internal_save_path();
		[LinkName("kinc_video_formats")]
		public static extern char8** video_formats();
		[LinkName("kinc_language")]
		public static extern char8* language();
		[LinkName("kinc_vibrate")]
		public static extern void vibrate(int32 ms);

		[LinkName("kinc_safe_zone")]
		public static extern float safe_zone();
		[LinkName("kinc_automatic_safe_zone")]
		public static extern bool automatic_safe_zone();
		[LinkName("kinc_set_safe_zone")]
		public static extern void set_safe_zone(float value);

		[LinkName("kinc_frequency")]
		public static extern double frequency();
		// kinc_ticks_t kinc_timestamp()
		[LinkName("kinc_time")]
		public static extern double time();

		[LinkName("kinc_start")]
		public static extern void start();
		[LinkName("kinc_stop")]
		public static extern void stop();

		[LinkName("kinc_login")]
		public static extern void login();
		[LinkName("kinc_waiting_for_login")]
		public static extern bool waiting_for_login();
		[LinkName("kinc_unlock_achievement")]
		public static extern void unlock_achievement(int32 id);
		[LinkName("kinc_disallow_user_change")]
		public static extern void disallow_user_change();
		[LinkName("kinc_allow_user_change")]
		public static extern void allow_user_change();

		[LinkName("kinc_set_keep_screen_on")]
		public static extern void set_keep_screen_on(bool on);

		typealias VoidFunc = function void();
		typealias strFunc = function char8*();

		[LinkName("kinc_set_update_callback")]
		public static extern void set_update_callback(VoidFunc callback);
		[LinkName("kinc_set_foreground_callback")]
		public static extern void set_foreground_callback(VoidFunc callback);
		[LinkName("kinc_set_resume_callback")]
		public static extern void set_resume_callback(VoidFunc callback);
		[LinkName("kinc_set_shutdown_callback")]
		public static extern void set_shutdown_callback(VoidFunc callback);
		[LinkName("kinc_set_drop_files_callback")]
		public static extern void set_drop_files_callback(function void(c_wchar* filepath) callback);
		[LinkName("kinc_set_cut_callback")]
		public static extern void set_cut_callback(strFunc callback);
		[LinkName("kinc_set_copy_callback")]
		public static extern void set_copy_callback(strFunc callback);
		[LinkName("kinc_set_paste_callback")]
		public static extern void set_paste_callback(function void(char8* text) callback);
		[LinkName("kinc_set_login_callback")]
		public static extern void set_login_callback(VoidFunc callback);
		[LinkName("kinc_set_logout_callback")]
		public static extern void set_logout_callback(VoidFunc callback);

		// -----------------------------------------------------------------------------
		//
		// window.h
		//
		// -----------------------------------------------------------------------------
		[LinkName("kinc_window_create")]
		public static extern int32 window_create(WindowOptions* win, FramebufferOptions* frame);
		[LinkName("kinc_window_destroy")]
		public static extern void window_destroy(int32 id);
		[LinkName("kinc_count_windows")]
		public static extern int32 count_windows();
		[LinkName("kinc_window_resize")]
		public static extern void window_resize(int32 window_index,int32 width,int32 height);
		[LinkName("kinc_window_move")]
		public static extern void window_move(int32 window_index,int32 x,int32 y);
		[LinkName("kinc_change_window_mode")]
		public static extern void change_window_mode(int32 window_index,WindowMode mode);
		[LinkName("kinc_change_window_mode")]
		public static extern void change_window_features(int32 window_index,int32 features);
		[LinkName("kinc_change_window_framebuffer")]
		public static extern int32 change_window_framebuffer(int32 window_index, FramebufferOptions* frame);

		[LinkName("kinc_window_x")]
		public static extern int32 window_x(int32 window_index);
		[LinkName("kinc_window_y")]
		public static extern int32 window_y(int32 window_index);
		[LinkName("kinc_window_width")]
		public static extern int32 window_width(int32 window_index);
		[LinkName("kinc_window_height")]
		public static extern int32 window_height(int32 window_index);
		[LinkName("kinc_window_display")]
		public static extern int32 window_display(int32 window_index);
		[LinkName("kinc_window_get_mode")]
		public static extern WindowMode window_get_mode(int32 window_index);
		[LinkName("kinc_window_show")]
		public static extern void window_show(int32 window_index);
		[LinkName("kinc_window_hide")]
		public static extern void window_hide(int32 window_index);
		[LinkName("kinc_window_set_title")]
		public static extern void window_set_title(int32 window_index,char8* title);
		[LinkName("kinc_window_set_resize_callback")]
		public static extern void window_set_resize_callback(int32 window_index,function void (int32 width,int32 height,void* data) callback,void* data);
		[LinkName("kinc_window_set_ppi_changed_callback")]
		public static extern void window_set_ppi_changed_callback(int32 window_index,function void(int32 ppi,void* data) callback,void* data);
		[LinkName("kinc_window_vsynced")]
		public static extern bool window_vsynced(int32 window_index);

		// -----------------------------------------------------------------------------
		//
		// image.h
		//
		// -----------------------------------------------------------------------------
		struct ImageReadCallbacks  {
			function int32(void* user_data, void* data, int32 size) read;
			function void(void* user_data,int32 pos) seek;
			function int32(void* user_data) pos;
			function Size_t(void* user_data) size;
		}

		[LinkName("kinc_image_init")]
		public static extern Size_t image_init(Image* image, void* memory,int32 width,int32 height,ImageFormat format);
		[LinkName("kinc_image_init3d")]
		public static extern Size_t image_init3d(Image* image, void* memory,int32 width,int32 height,int32 depth,ImageFormat format);
		[LinkName("kinc_image_size_from_file")]
		public static extern Size_t image_size_from_file(char8* filename);
		[LinkName("kinc_image_size_from_callbacks")]
		public static extern Size_t image_size_from_callbacks(ImageReadCallbacks callbacks, void* user_data,char8* filename);
		[LinkName("kinc_image_init_from_file")]
		public static extern Size_t image_init_from_file(Image* image, void* memory,char8* filename);
		[LinkName("kinc_image_init_from_callbacks")]
		public static extern Size_t image_init_from_callbacks(Image* image, void* memory,ImageReadCallbacks callbacks, void* user_data,char8* filename);

		[LinkName("kinc_image_init_from_bytes")]
		public static extern void image_init_from_bytes(Image* image, void* data,int32 width,int32 height,ImageFormat format);
		[LinkName("kinc_image_init_from_bytes3d")]
		public static extern void image_init_from_bytes3d(Image* image, void* data,int32 width,int32 height,int32 depth,ImageFormat format);
		[LinkName("kinc_image_destroy")]
		public static extern void image_destroy(Image* image);
		[LinkName("kinc_image_at")]
		public static extern void image_at(Image* image,int32 x, int32 y);
		[LinkName("kinc_image_get_pixels")]
		public static extern uint8* image_get_pixels(Image* image);
		[LinkName("kinc_image_format_sizeof")]
		public static extern int32 image_format_sizeof(ImageFormat format);

		// -----------------------------------------------------------------------------
		//
		// display.h
		//
		// -----------------------------------------------------------------------------
		[LinkName("kinc_display_init")]
		public static extern void display_init();
		[LinkName("kinc_primary_display")]
		public static extern int32 primary_display();
		[LinkName("kinc_count_displays")]
		public static extern int32 count_displays();
		[LinkName("kinc_display_available")]
		public static extern bool display_available(int32 display_index);
		[LinkName("kinc_display_name")]
		public static extern char8* display_name(int32 display_index);
		[LinkName("kinc_display_current_mode")]
		public static extern DisplayMode display_current_mode(int32 display_index);
		[LinkName("kinc_display_count_available_modes")]
		public static extern int32 display_count_available_modes(int32 display_index);
		[LinkName("kinc_display_available_mode")]
		public static extern DisplayMode display_available_mode(int32 display_index,int32 mode_index);

		// -----------------------------------------------------------------------------
		//
		// color.h
		//
		// -----------------------------------------------------------------------------
		[LinkName("kinc_color_components")]
		public static extern void color_components(uint32 color, float* red,float* green,float* blue,float* alpha);

		// -----------------------------------------------------------------------------
		//
		// socket.h
		//
		// -----------------------------------------------------------------------------
		[LinkName("kinc_socket_init")]
		public static extern void socket_init(Socket* socket);
		[LinkName("kinc_socket_destroy")]
		public static extern void socket_destroy(Socket* socket);
		[LinkName("kinc_socket_open")]
		public static extern bool socket_open(Socket* socket,uint16 port);
		[LinkName("kinc_socket_set_broadcast_enabled")]
		public static extern void socket_set_broadcast_enabled(Socket* socket,bool enabled);
		[LinkName("kinc_socket_send")]
		public static extern void socket_send(Socket* socket,uint32 address,uint16 port,void* data,int32 size);
		[LinkName("kinc_socket_send_url")]
		public static extern void socket_send_url(Socket* socket,uint32 address,char8* url,void* data,int32 size);
		[LinkName("kinc_socket_receive")]
		public static extern int32 socket_receive(Socket* socket,uint8* data,int32 max_size,uint32 from_address,uint16 from_port);
		[LinkName("kinc_url_to_int")]
		public static extern uint32 url_to_int(char8* url,int32 port);
		// -----------------------------------------------------------------------------
		//
		// http.h
		//
		// -----------------------------------------------------------------------------
		typealias HttpCallback = function void(int32 error,int32 response,char8* body,void* callbackdata);

		[LinkName("kinc_http_request")]
		public static extern void http_request(char8* url,char8* path,char8* data,int32 port,bool secure,int32 method,char8* header,HttpCallback callback,void* callbackData);
		// -----------------------------------------------------------------------------
		//
		// audio2.h
		//
		// -----------------------------------------------------------------------------
		[LinkName("kinc_a2_init")]
		public static extern void audio2_init();
		[LinkName("kinc_a2_set_callback")]
		public static extern void a2_set_callback(function void(AudioBuffer buffer,int32 samples) callback);
		[LinkName("kinc_a2_set_callback")]
		public static extern void a2_set_sample_rate_callback(function void() callback);
		[LinkName("kinc_a2_samples_per_second")]
		public static extern int32 a2_samples_per_second;
		[LinkName("kinc_a2_update")]
		public static extern void a2_update();
		[LinkName("kinc_a2_shutdown")]
		public static extern void a2_shutdown();
		// -----------------------------------------------------------------------------
		//
		// vrinterface.h
		//
		// -----------------------------------------------------------------------------
		[LinkName("kinc_vr_interface_init")]
		public static extern void* vr_interface_init(void* hinst,char8* title,char8* window_class_name);
		[LinkName("kinc_vr_interface_begin")]
		public static extern void vr_interface_begin();
		[LinkName("kinc_vr_interface_begin_render")]
		public static extern void vr_interface_begin_render(int32 eye);
		[LinkName("kinc_vr_interface_end_render")]
		public static extern void vr_interface_end_render(int32 eye);
		[LinkName("kinc_vr_interface_get_sensor_state")]
		public static extern VrSensorState vr_interface_get_sensor_state(int32 eye);
		[LinkName("kinc_vr_interface_get_controller")]
		public static extern VrPosState vr_interface_get_controller(int32 index);
		[LinkName("kinc_vr_interface_warp_swap")]
		public static extern void vr_interface_warp_swap();
		[LinkName("kinc_vr_interface_update_tracking_origin")]
		public static extern void vr_interface_update_tracking_origin(TrackingOrigin origin);
		[LinkName("kinc_vr_interface_reset_hmd_pose")]
		public static extern void vr_interface_reset_hmd_pose();
		[LinkName("kinc_vr_interface_ovr_shutdown")]
		public static extern void vr_interface_ovr_shutdown();

		// -----------------------------------------------------------------------------
		//
		// matrix.h
		//
		// -----------------------------------------------------------------------------
		[LinkName("kinc_matrix3x3_get")]
		public static extern float matrix3x3_get(Matrix3x3* matrix,int32 x,int32 y);
		[LinkName("kinc_matrix3x3_set")]
		public static extern void matrix3x3_set(Matrix3x3* matrix,int32 x,int32 y,float value);
		[LinkName("kinc_matrix3x3_transpose")]
		public static extern void matrix3x3_transpose(Matrix3x3* matrix);
		[LinkName("kinc_matrix3x3_identity")]
		public static extern Matrix3x3 matrix3x3_identity();

		[LinkName("kinc_matrix3x_rotation_x")]
		public static extern Matrix3x3 matrix3x_rotation_x(float alpha);
		[LinkName("kinc_matrix3x_rotation_y")]
		public static extern Matrix3x3 matrix3x_rotation_y(float alpha);
		[LinkName("kinc_matrix3x_rotation_z")]
		public static extern Matrix3x3 matrix3x_rotation_z(float alpha);

		[LinkName("kinc_matrix4x4_get")]
		public static extern float matrix4x4_get(Matrix4x4* matrix,int32 x,int32 y);
		[LinkName("kinc_matrix4x4_set")]
		public static extern void matrix4x4_set(Matrix4x4* matrix,int32 x,int32 y,float value);
		[LinkName("kinc_matrix4x4_transpose")]
		public static extern void matrix4x4_transpose(Matrix4x4* matrix);
		[LinkName("kinc_matrix4x4_multiply")]
		public static extern void matrix4x4_multiply(Matrix4x4* a,Matrix4x4* b);

		// -----------------------------------------------------------------------------
		//
		// random.h
		//
		// -----------------------------------------------------------------------------
		[LinkName("kinc_random_init")]
		public static extern void random_init(int32 seed);
		[LinkName("kinc_random_get")]
		public static extern int32 random_get();
		[LinkName("kinc_random_get_max")]
		public static extern int32 random_get_max(int32 max);
		[LinkName("kinc_random_get_in")]
		public static extern int32 random_get_in(int32 min,int32 max);

		// -----------------------------------------------------------------------------
		//
		// math/core.h
		//
		// -----------------------------------------------------------------------------
		[LinkName("kinc_sin")]
		public static extern float sin(float value);
		[LinkName("kinc_cos")]
		public static extern float cos(float value);
		[LinkName("kinc_tan")]
		public static extern float tan(float value);
		[LinkName("kinc_cot")]
		public static extern float cot(float value);
		[LinkName("kinc_round")]
		public static extern float round(float value);
		[LinkName("kinc_ceil")]
		public static extern float ceil(float value);
		/*
		pow :: proc(value: _c.float) -> _c.float ---;
		max_float :: proc() -> _c.float ---;
		sqrt :: proc(value: _c.float) -> _c.float ---;
		abs :: proc(value: _c.float) -> _c.float ---;
		asin :: proc(value: _c.float) -> _c.float ---;
		acos :: proc(value: _c.float) -> _c.float ---;
		atan :: proc(value: _c.float) -> _c.float ---;
		atan2 :: proc(y: _c.float, x: _c.float) -> _c.float ---;
		floor :: proc(value: _c.float) -> _c.float ---;
		mod :: proc(numer: _c.float, denom: _c.float) -> _c.float ---;
		exp :: proc(exponent: _c.float) -> _c.float ---;
		min :: proc(a: _c.float, b: _c.float) -> _c.float ---;
		max :: proc(a: _c.float, b: _c.float) -> _c.float ---;
		maxi :: proc(a: _c.int, b: _c.int) -> _c.int ---;
		mini :: proc(a: _c.int, b: _c.int) -> _c.int ---;
		clamp :: proc(value: _c.float, min_value: _c.float, max_value: _c.float) -> _c.int ---;*/
	}
}
