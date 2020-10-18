namespace kinc_beef
{
	interface KincApp
	{
		static void update();
		static void foreground(){};
		static void resume(){};
		static void shutdown();
		static void drop_files(char16* filepath){};
		static char8* cut(){return "";};
		static char8* copy(){return "";};
		static void paste(char8* text){};
		static void login(){};
		static void logout(){};
	}
}
