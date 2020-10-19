using System;

using System.Interop;
using System.FFI;
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
		public static extern void a2_init();
		[LinkName("kinc_a2_set_callback")]
		public static extern void a2_set_callback(function void(AudioBuffer buffer,int32 samples) callback);
		[LinkName("kinc_a2_set_callback")]
		public static extern void a2_set_sample_rate_callback(function void() callback);
		[LinkName("__imp_kinc_a2_samples_per_second")]
		static extern int32* a2_samples_per_second;
		public static int32 get_a2_samples_per_second(){
			return *a2_samples_per_second;
		}
		public static void set_a2_samples_per_second(int32 value){
			*a2_samples_per_second = value;
		}
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
		[LinkName("kinc_pow")]
		public static extern float pow(float value);
		[LinkName("kinc_max_float")]
		public static extern float max_float();
		[LinkName("kinc_sqrt")]
		public static extern float sqrt(float value);
		[LinkName("kinc_abs")]
		public static extern float abs(float value);
		[LinkName("kinc_asin")]
		public static extern float asin(float value);
		[LinkName("kinc_acos")]
		public static extern float acos(float value);
		[LinkName("kinc_atan")]
		public static extern float atan(float value);
		[LinkName("kinc_atan2")]
		public static extern float atan2(float value);
		[LinkName("kinc_floor")]
		public static extern float floor(float value);
		[LinkName("kinc_mod")]
		public static extern float mod(float number,float denom);
		[LinkName("kinc_exp")]
		public static extern float exp(float exponent);
		[LinkName("kinc_min")]
		public static extern float min(float a,float b);
		[LinkName("kinc_max")]
		public static extern float max(float a,float b);
		[LinkName("kinc_mini")]
		public static extern int32 mini(int32 a,int32 b);
		[LinkName("kinc_max")]
		public static extern int32 maxi(int32 a,int32 b);
		[LinkName("kinc_clamp")]
		public static extern float clamp(float value,float min_value,float max_value);
		// -----------------------------------------------------------------------------
		//
		// filewriter.h
		//
		// -----------------------------------------------------------------------------

		[LinkName("kinc_file_writer_open")]
		public static extern bool file_writer_open(FileWriter* writer,char8* filepath);
		[LinkName("kinc_file_writer_write")]
		public static extern void file_writer_write(FileWriter* writer,void* data,int32 size);
		[LinkName("kinc_file_writer_close")]
		public static extern void file_writer_close(FileWriter* writer);
		
		// -----------------------------------------------------------------------------
		//
		// filereader.h
		//
		// -----------------------------------------------------------------------------
		[LinkName("kinc_file_reader_open")]
		public static extern bool file_reader_open(FileReader* reader,char8* filename,FileType type);
		[LinkName("kinc_file_reader_close")]
		public static extern void file_reader_close(FileReader* reader);
		[LinkName("kinc_file_reader_read")]
		public static extern int32 file_reader_read(FileReader* reader,void* data,Size_t size);
		[LinkName("kinc_file_reader_size")]
		public static extern Size_t file_reader_size(FileReader* reader);
		[LinkName("kinc_file_reader_pos")]
		public static extern int32 file_reader_pos(FileReader* reader);
		[LinkName("kinc_file_reader_seek")]
		public static extern void file_reader_seek(FileReader* reader,int32 pos);

		[LinkName("kinc_read_f32le")]
		public static extern float file_read_f32le(uint8* data);
		[LinkName("kinc_read_f32be")]
		public static extern float file_read_f32be(uint8* data);

		[LinkName("kinc_read_u64le")]
		public static extern uint64 file_read_u64le(uint8* data);
		[LinkName("kinc_read_u64be")]
		public static extern uint64 file_read_u64be(uint8* data);

		[LinkName("kinc_read_s64le")]
		public static extern int64 file_read_s64le(uint8* data);
		[LinkName("kinc_read_s64be")]
		public static extern int64 file_read_s64be(uint8* data);

		[LinkName("kinc_read_u32le")]
		public static extern uint32 file_read_u32le(uint8* data);
		[LinkName("kinc_read_u32be")]
		public static extern uint32 file_read_u32be(uint8* data);

		[LinkName("kinc_read_s32le")]
		public static extern int32 file_read_s32le(uint8* data);
		[LinkName("kinc_read_s32be")]
		public static extern int32 file_read_s32be(uint8* data);

		[LinkName("kinc_read_u16le")]
		public static extern uint16 file_read_u16le(uint8* data);
		[LinkName("kinc_read_u16be")]
		public static extern uint16 file_read_u16be(uint8* data);

		[LinkName("kinc_read_s16le")]
		public static extern int16 file_read_s16le(uint8* data);
		[LinkName("kinc_read_s16be")]
		public static extern int16 file_read_s16be(uint8* data);

		[LinkName("kinc_read_u8")]
		public static extern uint8 file_read_u8(uint8* data);
		[LinkName("kinc_read_i8")]
		public static extern int8 file_read_i8(uint8* data);

		// -----------------------------------------------------------------------------
		//
		// keyboard.h
		//
		// -----------------------------------------------------------------------------

		[LinkName("kinc_keyboard_show")]
		public static extern void keyboard_show();
		[LinkName("kinc_keyboard_hide")]
		public static extern void keyboard_hide();
		[LinkName("kinc_keyboard_active")]
		public static extern bool keyboard_active();

		
		[LinkName("__imp_kinc_keyboard_key_down_callback")]
		static extern function void(KeyCode keycode)* keyboard_key_down_callback;
		public static void set_key_down_callback(function void(KeyCode keycode) callback){
			#unwarn// Don't warn when we don't use the function
			*keyboard_key_down_callback = callback;
		}

		[LinkName("__imp_kinc_keyboard_key_up_callback")]
		static extern function void(KeyCode keycode)* keyboard_key_up_callback;
		public static void set_key_up_callback(function void(KeyCode keycode) callback){
			#unwarn// Don't warn when we don't use the function
			*keyboard_key_up_callback = callback;
		}

		[LinkName("__imp_kinc_keyboard_key_press_callback")]
		static extern function void(uint32 character)* keyboard_key_press_callback;
		public static void set_key_pressed_callback(function void(uint32 character) callback){
			#unwarn// Don't warn when we don't use the function
			*keyboard_key_press_callback = callback;
		}

		// -----------------------------------------------------------------------------
		//
		// mouse.h
		//
		// -----------------------------------------------------------------------------
		[LinkName("kinc_mouse_can_lock")]
		public static extern bool mouse_can_lock(int32 window);
		[LinkName("kinc_mouse_is_lock")]
		public static extern bool mouse_is_lock(int32 window);
		[LinkName("kinc_mouse_lock")]
		public static extern void mouse_lock(int32 window);
		[LinkName("kinc_mouse_unlock")]
		public static extern void mouse_unlock(int32 window);

		[LinkName("kinc_mouse_set_cursor")]
		public static extern void mouse_set_cursor(int32 cursor);

		[LinkName("kinc_mouse_show")]
		public static extern void mouse_show();
		[LinkName("kinc_mouse_hide")]
		public static extern void mouse_hide();
		[LinkName("kinc_mouse_set_position")]
		public static extern void mouse_set_position(int32 window,int32 x, int32 y);
		[LinkName("kinc_mouse_set_position")]
		public static extern void mouse_get_position(int32 window,int32* x, int32* y);

		[LinkName("__imp_kinc_mouse_press_callback")]
		static extern function void(int32 window,int32 button,int32 x,int32 y)* mouse_press_callback;
		public static void set_mouse_press_callback(function void(int32 window,int32 button,int32 x,int32 y) callback){
			#unwarn// Don't warn when we don't use the function
			*mouse_press_callback = callback;
		}

		[LinkName("__imp_kinc_mouse_release_callback")]
		static extern function void(int32 window,int32 button,int32 x,int32 y)* mouse_release_callback;
		public static void set_mouse_release_callback(function void(int32 window,int32 button,int32 x,int32 y) callback){
			#unwarn// Don't warn when we don't use the function
			*mouse_release_callback = callback;
		}

		[LinkName("__imp_kinc_mouse_move_callback")]
		static extern function void(int32 window,int32 x,int32 y,int32 movement_x,int32 movement_y)* mouse_move_callback;
		public static void set_mouse_move_callback(function void(int32 window,int32 x,int32 y,int32 movement_x,int32 movement_y) callback){
			#unwarn// Don't warn when we don't use the function
			*mouse_move_callback = callback;
		}

		[LinkName("__imp_kinc_mouse_scroll_callback")]
		static extern function void(int32 window,int32 delta)* mouse_scroll_callback;
		public static void set_mouse_scroll_callback(function void(int32 window,int32 delta) callback){
			#unwarn// Don't warn when we don't use the function
			*mouse_scroll_callback = callback;
		}

		[LinkName("__imp_kinc_mouse_enter_window_callback")]
		static extern function void(int32 window)* mouse_enter_window_callback;
		public static void set_mouse_enter_window_callback(function void(int32 window) callback){
			#unwarn// Don't warn when we don't use the function
			*mouse_enter_window_callback = callback;
		}

		[LinkName("__imp_kinc_mouse_leave_window_callback")]
		static extern function void(int32 window)* mouse_leave_window_callback;
		public static void set_mouse_leave_window_callback(function void(int32 window) callback){
			#unwarn// Don't warn when we don't use the function
			*mouse_leave_window_callback = callback;
		}

		// -----------------------------------------------------------------------------
		//
		// gamepad.h
		//
		// -----------------------------------------------------------------------------
		[LinkName("kinc_gamepad_vendor")]
		public static extern char8* gamepad_vendor(int32 gamepad);
		[LinkName("kinc_gamepad_product_name")]
		public static extern char8* gamepad_product_name(int32 gamepad);
		[LinkName("kinc_gamepad_connected")]
		public static extern bool gamepad_connected(int32 gamepad);

		[LinkName("__imp_kinc_gamepad_axis_callback")]
		static extern function void(int32 gamepad,int32 axis,float value)* gamepad_axis_callback;
		public static void set_gamepad_axis_callback(function void(int32 gamepad,int32 axis,float value) callback){
			#unwarn// Don't warn when we don't use the function
			*gamepad_axis_callback = callback;
		}

		[LinkName("__imp_kinc_gamepad_button_callback")]
		static extern function void(int32 gamepad,int32 button,float value)* gamepad_button_callback;
		public static void set_gamepad_button_callback(function void(int32 gamepad,int32 button,float value) callback){
			#unwarn// Don't warn when we don't use the function
			*gamepad_button_callback = callback;
		}

		// -----------------------------------------------------------------------------
		//
		// graphics4.h
		//
		// -----------------------------------------------------------------------------
		struct TextureUnit;//Just a handle struct

		[LinkName("kinc_g4_init")]
		public static extern void g4_init(int32 window,int32 depth_buffer_bits,int32 stencil_buffer_bits,bool vsync);
		[LinkName("kinc_g4_destroy")]
		public static extern void g4_destroy(int32 window);

		[LinkName("kinc_g4_flush")]
		public static extern void g4_flush();

		[LinkName("kinc_g4_begin")]
		public static extern void g4_begin(int32 window);
		[LinkName("kinc_g4_end")]
		public static extern void g4_end(int32 window);

		[LinkName("kinc_g4_swap_buffers")]
		public static extern bool g4_swap_buffers();

		[LinkName("kinc_g4_clear")]
		public static extern void g4_clear(uint32 flags,uint32 color,float depth,int32 stencil);
		[LinkName("kinc_g4_viewport")]
		public static extern void g4_viewport(int32 x,int32 y, int32 width,int32 height);
		[LinkName("kinc_g4_scissor")]
		public static extern void g4_scissor(int32 x,int32 y, int32 width,int32 height);
		[LinkName("kinc_g4_disable_scissor")]
		public static extern void g4_disable_scissor();
		[LinkName("kinc_g4_draw_indexed_vertices")]
		public static extern void g4_draw_indexed_vertices();
		[LinkName("kinc_g4_draw_indexed_vertices_from_to")]
		public static extern void g4_draw_indexed_vertices_from_to(int32 start,int32 count);
		[LinkName("kinc_g4_draw_indexed_vertices_from_to_from")]
		public static extern void g4_draw_indexed_vertices_from_to_from(int32 start,int32 count,int32 vertex_offset);
		[LinkName("kinc_g4_draw_indexed_vertices_instanced_from_to")]
		public static extern void g4_draw_indexed_vertices_instanced_from_to(int32 instance_count,int32 start,int32 count);

		[LinkName("kinc_g4_set_texture_addressing")]
		public static extern void g4_set_texture_addressing(TextureUnit unit,TextureDirection dir,TextureAddressing addressing);
		[LinkName("kinc_g4_set_texture3d_addressing")]
		public static extern void g4_set_texture3d_addressing(TextureUnit unit,TextureDirection dir,TextureAddressing addressing);
		/*
		g4_set_pipeline :: proc(pipeline: ^Pipeline) ---;
		g4_set_stencil_reference_value :: proc(value: _c.int) ---;
		g4_set_texture_operation :: proc(operation: Texture_Operation, arg1: Texture_Argument, arg2: Texture_Argument) ---;

		g4_set_int :: proc(location: Constant_Location, value: _c.int) ---;
		g4_set_int2 :: proc(location: Constant_Location, value1: _c.int, value2: _c.int) ---;
		g4_set_int3 :: proc(location: Constant_Location, value1: _c.int, value2: _c.int, value3: _c.int) ---;
		g4_set_int4 :: proc(location: Constant_Location, value1: _c.int, value2: _c.int, value3: _c.int, value4: _c.int) ---;
		g4_set_ints :: proc(location: Constant_Location, values: ^_c.float, count: _c.int) ---;

		g4_set_bool :: proc(location: Constant_Location, value: _c.bool) ---;

		g4_set_matrix3 :: proc(location: Constant_Location, value: ^Matrix3x3) ---;
		g4_set_matrix4 :: proc(location: Constant_Location, value: ^Matrix4x4) ---;

		g4_set_texture_magnification_filter :: proc(unit: Texture_Unit, filter: Texture_Filter) ---;
		g4_set_texture3d_magnification_filter :: proc(unit: Texture_Unit, filter: Texture_Filter) ---;

		g4_set_texture_minification_filter :: proc(unit: Texture_Unit, filter: Texture_Filter) ---;
		g4_set_texture3d_minification_filter :: proc(unit: Texture_Unit, filter: Texture_Filter) ---;

		g4_set_texture_mipmap_filter :: proc(unit: Texture_Unit, filter: Mipmap_Filter) ---;
		g4_set_texture3d_mipmap_filter :: proc(unit: Texture_Unit, filter: Mipmap_Filter) ---;

		g4_set_texture_compare_mode :: proc(unit: Texture_Unit, enabled: _c.bool) ---;
		g4_set_cubemap_compare_mode :: proc(unit: Texture_Unit, enabled: _c.bool) ---;

		g4_max_bound_textures :: proc() -> _c.int ---;
		g4_render_targets_inverted_y :: proc() -> _c.bool ---;
		g4_non_pow2_textures_supported :: proc() -> _c.bool ---;

		g4_restore_render_target :: proc() ---;
		g4_set_render_targets :: proc(targets: ^^Render_Target, count: _c.int) ---;
		g4_set_render_target_face :: proc(texture: ^Render_Target, face: _c.int) ---;

		g4_set_texture :: proc(unit: Texture_Unit, texture: ^Texture) ---;
		g4_set_image_texture :: proc(unit: Texture_Unit, texture: ^Texture) ---;

		g4_init_occlusion_query :: proc(occlusion_query: ^_c.uint) -> _c.bool ---;
		g4_delete_occlusion_query :: proc(occlusion_query: ^_c.uint) ---;
		g4_start_occlusion_query :: proc(occlusion_query: ^_c.uint) ---;
		g4_end_occlusion_query :: proc(occlusion_query: ^_c.uint) ---;

		g4_are_query_results_available :: proc(occlusion_query: ^_c.uint) -> _c.bool ---;
		g4_get_query_results :: proc(occlusion_query: ^_c.uint, pixel_count: ^_c.uint) -> _c.bool ---;
		g4_set_texture_array :: proc(unit: Texture_Unit, array: ^Texture_Array) ---;
		g4_antialiasing_samples :: proc() -> _c.int ---;
		g4_set_antialiasing_samples :: proc(samples: _c.int) ---;*/

	}
}
