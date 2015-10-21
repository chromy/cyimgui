import imgui

def my_render_function():
    print 'foo'

io = imgui.get_io()
io.display_size = 1920.0, 1280.0
io.render_draw_lists_fn = my_render_function
io.fonts.add_font_default()
io.fonts.get_tex_data_as_rgba32()


## Application main loop
while True:
    io = imgui.get_io();
    io.delta_time = 1.0/60.0;

    print 'Render'
    imgui.new_frame()
    imgui.begin("My window")
    imgui.text("Hello, world.")
    imgui.end()
    imgui.render()
    print '...done'
    #io.mouse_pos = mouse_pos;
    #io.mouse_down[0] = mouse_button_0;
    # io.KeysDown[i] = ...
#
#
