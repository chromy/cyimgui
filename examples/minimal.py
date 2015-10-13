import imgui

# Application init
io = imgui.GetIO();
io.DisplaySize.x = 1920.0;
io.DisplaySize.y = 1280.0;
io.IniFilename = "imgui.ini";
io.RenderDrawListsFn = my_render_function;  # Setup a render function, or set to NULL and call GetDrawData() after Render() to access the render data.
# TODO: Fill others settings of the io structure

# Load texture atlas
#unsigned char* pixels;
#int width, height, bytes_per_pixels;
#io.Fonts.GetTexDataAsRGBA32(pixels, &width, &height, &bytes_per_pixels);
# TODO: copy texture to graphics memory.
# TODO: store your texture pointer/identifier in 'io.Fonts->TexID'

# Application main loop
while True:
    # 1) get low-level input
    # e.g. on Win32, GetKeyboardState(), or poll your events, etc.

    # 2) TODO: fill all fields of IO structure and call NewFrame
    io = imgui.GetIO();
    io.DeltaTime = 1.0/60.0;
    io.MousePos = mouse_pos;
    io.MouseDown[0] = mouse_button_0;
    # io.KeysDown[i] = ...
    imgui.NewFrame();

    # 3) most of your application code here - you can use any of imgui.* functions at any point in the frame
    imgui.Begin("My window");
    imgui.Text("Hello, world.");
    imgui.End();
    GameUpdate();
    GameRender();

    # 4) render & swap video buffers
    imgui.Render();
