using System;

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

		[LinkName("kinc_run")]
		public static extern void run(void* value);

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

		/* Callbacks */
		public delegate void VoidCallback();
		public delegate char8* CutCallback();
		public delegate char8* CopyCallback();
		public delegate void PasteCallback(char8* text);
		public delegate void ResizeCallback(int32 width,int32 height,void* data);
		public delegate void PpiCallback(int32 ppi,void* data);

		[LinkName("kinc_set_update_callback")]
		public static extern void set_update_callback(function void(Game) callback);
		[LinkName("kinc_set_foreground_callback")]
		public static extern void set_foreground_callback(VoidCallback callback);
		[LinkName("kinc_set_resume_callback")]
		public static extern void set_resume_callback(VoidCallback callback);
		[LinkName("kinc_set_shutdown_callback")]
		public static extern void set_shutdown_callback(VoidCallback callback);
		//static void (*drop_files_callback)(wchar_t *) = NULL;
		[LinkName("kinc_set_cut_callback")]
		public static extern void set_cut_callback(CutCallback callback);
		[LinkName("kinc_set_copy_callback")]
		public static extern void set_copy_callback(CopyCallback callback);
		[LinkName("kinc_set_paste_callback")]
		public static extern void set_paste_callback(PasteCallback callback);
		[LinkName("kinc_set_login_callback")]
		public static extern void set_login_callback(VoidCallback callback);
		[LinkName("kinc_set_logout_callback")]
		public static extern void set_logout_callback(VoidCallback callback);

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
		public static extern void window_set_resize_callback(int32 window_index,ResizeCallback callback,void* data);
		[LinkName("kinc_window_set_ppi_changed_callback")]
		public static extern void window_set_ppi_changed_callback(int32 window_index,PpiCallback callback,void* data);
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
		[LinkName("kinc_image_size_from_callbacks ")]
		public static extern Size_t image_size_from_callbacks(ImageReadCallbacks callbacks, void* user_data,char8* filename);
		//image_size_from_callbacks :: proc(callbacks: Image_Read_Callbacks, user_data: rawptr, filename: cstring) -> _c.size_t ---;

		/*
		image_init_from_file :: proc(image: ^Image, memory: rawptr, filename: cstring) -> _c.size_t ---;
		image_init_from_callbacks :: proc(image: ^Image, memory: rawptr, callbacks: Image_Read_Callbacks, user_data: rawptr, filename: cstring) -> _c.size_t ---;

		image_init_from_bytes :: proc(image: ^Image, data: rawptr, width: _c.int, height: _c.int, format: Image_Format) ---;
		image_init_from_bytes3d :: proc(image: ^Image, data: rawptr, width: _c.int, height: _c.int, depth: _c.int, format: Image_Format) ---;
		image_destroy :: proc(image: ^Image) ---;
		image_at :: proc(image: ^Image, x: _c.int, y: _c.int) ---;
		image_get_pixels :: proc(image: ^Image) -> u8 ---; //uint8_t i hope is u8

		image_format_sizeof :: proc(format: Image_Format) -> _c.int ---;*/
		
	}
}
