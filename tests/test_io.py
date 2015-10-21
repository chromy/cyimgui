import imgui

def test_getting_and_setting_display_size():
    io = imgui.get_io()
    io.display_size = (1.0, 2.0)
    assert io.display_size == (1.0, 2.0)
    assert io.display_size == imgui.get_io().display_size

