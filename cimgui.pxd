# distutils: language = c++
# distutils: sources = imgui/imgui.cpp imgui/imgui_draw.cpp
from libcpp cimport bool

cdef extern from "imgui/imgui.h":
    ctypedef struct ImGuiIO:
        pass
    ctypedef struct ImGuiStyle:
        pass
    ctypedef struct ImDrawCmd:
        pass
    ctypedef struct ImDrawList:
        pass
    ctypedef struct ImDrawData:
        pass
    ctypedef struct ImFont:
        pass
    ctypedef struct ImFontAtlas:
        pass
    ctypedef struct ImGuiIO:
        pass
    ctypedef struct ImGuiStorage:
        pass
    ctypedef struct ImGuiStyle:
        pass

    ctypedef struct ImVec2:
        pass

    ctypedef int ImGuiCol;
    ctypedef int ImGuiStyleVar;
    ctypedef int ImGuiKey;
    ctypedef int ImGuiAlign;
    ctypedef int ImGuiColorEditMode;
    ctypedef int ImGuiMouseCursor;
    ctypedef int ImGuiWindowFlags;
    ctypedef int ImGuiSetCond;
    ctypedef int ImGuiInputTextFlags;
    ctypedef int ImGuiSelectableFlags;

cdef extern from "imgui/imgui.h" namespace "ImGui":
    # Main
    ImGuiIO& GetIO();
    ImGuiStyle& GetStyle();
    ImDrawData* GetDrawData();
    void NewFrame();
    void Render();
    void Shutdown();
    void ShowUserGuide();
    void ShowStyleEditor(ImGuiStyle* ref); #TODO: add optional arguments
    void ShowTestWindow(bool* opened);
    void ShowTestWindow();
    void ShowMetricsWindow(bool* opened);
    void ShowMetricsWindow();

    # Window
    bool Begin(const char* name, bool* p_opened, ImGuiWindowFlags flags); #TODO add optional arguments
    bool Begin(const char* name, bool* p_opened, const ImVec2& size_on_first_use, float bg_alpha, ImGuiWindowFlags flags);
    #void End();
    #bool BeginChild(const char* str_id, const ImVec2& size = ImVec2(0,0), bool border = false, ImGuiWindowFlags extra_flags = 0);  # begin a scrolling region. size==0.0f: use remaining window size, size<0.0f: use remaining window size minus abs(size). size>0.0f: fixed size. each axis can use a different mode, e.g. ImVec2(0,400).
    #bool BeginChild(ImGuiID id, const ImVec2& size = ImVec2(0,0), bool border = false, ImGuiWindowFlags extra_flags = 0); # "
    #void EndChild();
    #ImVec2 GetContentRegionMax(); # current content boundaries (typically window boundaries including scrolling, or current column boundaries), in windows coordinates
    #ImVec2 GetContentRegionAvail(); # == GetContentRegionMax() - GetCursorPos()
    #float GetContentRegionAvailWidth(); #
    #ImVec2 GetWindowContentRegionMin(); # content boundaries min (roughly (0,0)-Scroll), in window coordinates
    #ImVec2 GetWindowContentRegionMax(); # content boundaries max (roughly (0,0)+Size-Scroll) where Size can be override with SetNextWindowContentSize(), in window coordinates
    #float GetWindowContentRegionWidth(); # 
    #ImDrawList*   GetWindowDrawList(); # get rendering command-list if you want to append your own draw primitives
    #ImFont* GetWindowFont();
    #float GetWindowFontSize(); # size (also height in pixels) of current font with current scale applied
    #void SetWindowFontScale(float scale); # per-window font scale. Adjust IO.FontGlobalScale if you want to scale all windows
    #ImVec2 GetWindowPos(); # get current window position in screen space (useful if you want to do your own drawing via the DrawList api)
    #ImVec2 GetWindowSize(); # get current window size
    #float GetWindowWidth();
    #float GetWindowHeight();
    #bool IsWindowCollapsed();

    #void SetNextWindowPos(const ImVec2& pos, ImGuiSetCond cond = 0); # set next window position. call before Begin()
    #void SetNextWindowPosCenter(ImGuiSetCond cond = 0); # set next window position to be centered on screen. call before Begin()
    #void SetNextWindowSize(const ImVec2& size, ImGuiSetCond cond = 0); # set next window size. set axis to 0.0f to force an auto-fit on this axis. call before Begin()
    #void SetNextWindowContentSize(const ImVec2& size); # set next window content size (enforce the range of scrollbars). set axis to 0.0f to leave it automatic. call before Begin()
    #void SetNextWindowContentWidth(float width); # set next window content width (enforce the range of horizontal scrollbar). call before Begin() 
    #void SetNextWindowCollapsed(bool collapsed, ImGuiSetCond cond = 0); # set next window collapsed state. call before Begin()
    #void SetNextWindowFocus(); # set next window to be focused / front-most. call before Begin()
    #void SetWindowPos(const ImVec2& pos, ImGuiSetCond cond = 0); # set current window position - call within Begin()/End(). may incur tearing
    #void SetWindowSize(const ImVec2& size, ImGuiSetCond cond = 0); # set current window size. set to ImVec2(0,0) to force an auto-fit. may incur tearing
    #void SetWindowCollapsed(bool collapsed, ImGuiSetCond cond = 0); # set current window collapsed state
    #void SetWindowFocus(); # set current window to be focused / front-most
    #void SetWindowPos(const char* name, const ImVec2& pos, ImGuiSetCond cond = 0); # set named window position - call within Begin()/End(). may incur tearing
    #void SetWindowSize(const char* name, const ImVec2& size, ImGuiSetCond cond = 0);    # set named window size. set axis to 0.0f to force an auto-fit on this axis. may incur tearing
    #void SetWindowCollapsed(const char* name, bool collapsed, ImGuiSetCond cond = 0);   # set named window collapsed state
    #void SetWindowFocus(const char* name); # set named window to be focused / front-most. use NULL to remove focus.

    #float GetScrollX(); # get scrolling amount [0..GetScrollMaxX()]
    #float GetScrollY(); # get scrolling amount [0..GetScrollMaxY()]
    #float GetScrollMaxX(); # get maximum scrolling amount ~~ ContentSize.X - WindowSize.X
    #float GetScrollMaxY(); # get maximum scrolling amount ~~ ContentSize.Y - WindowSize.Y
    #void SetScrollX(float scroll_x); # set scrolling amount [0..GetScrollMaxX()]
    #void SetScrollY(float scroll_y); # set scrolling amount [0..GetScrollMaxY()]
    #void SetScrollHere(float center_y_ratio = 0.5f); # adjust scrolling amount to make current cursor position visible. center_y_ratio=0.0: top, 0.5: center, 1.0: bottom.
    #void SetScrollFromPosY(float pos_y, float center_y_ratio = 0.5f); # adjust scrolling amount to make given position valid. use GetCursorPos() or GetCursorStartPos()+offset to get valid positions.
    #void SetKeyboardFocusHere(int offset = 0); # focus keyboard on the next widget. Use positive 'offset' to access sub components of a multiple component widget
    #void SetStateStorage(ImGuiStorage* tree); # replace tree state storage with our own (if you want to manipulate it yourself, typically clear subsection of it)
    #ImGuiStorage* GetStateStorage();

    ## Parameters stacks (shared)
    #void PushFont(ImFont* font); # use NULL as a shortcut to push default font
    #void PopFont();
    #void PushStyleColor(ImGuiCol idx, const ImVec4& col);
    #void PopStyleColor(int count = 1);
    #void PushStyleVar(ImGuiStyleVar idx, float val);
    #void PushStyleVar(ImGuiStyleVar idx, const ImVec2& val);
    #void PopStyleVar(int count = 1);

    ## Parameters stacks (current window)
    #void PushItemWidth(float item_width); # width of items for the common item+label case, pixels. 0.0f = default to ~2/3 of windows width, >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -1.0f always align width to the right side)
    #void PopItemWidth();
    #float CalcItemWidth(); # width of item given pushed settings and current cursor position
    #void PushTextWrapPos(float wrap_pos_x = 0.0f); # word-wrapping for Text*() commands. < 0.0f: no wrapping; 0.0f: wrap to end of window (or column); > 0.0f: wrap at 'wrap_pos_x' position in window local space
    #void PopTextWrapPos();
    #void PushAllowKeyboardFocus(bool v); # allow focusing using TAB/Shift-TAB, enabled by default but you can disable it for certain widgets
    #void PopAllowKeyboardFocus();
    #void PushButtonRepeat(bool repeat); # in 'repeat' mode, Button*() functions return repeated true in a typematic manner (uses io.KeyRepeatDelay/io.KeyRepeatRate for now). Note that you can call IsItemActive() after any Button() to tell if the button is held in the current frame.
    #void PopButtonRepeat();

    ## Cursor / Layout
    #void BeginGroup(); # lock horizontal starting position. once closing a group it is seen as a single item (so you can use IsItemHovered() on a group, SameLine() between groups, etc.
    #void EndGroup();
    #void Separator(); # horizontal line
    #void SameLine(float local_pos_x = 0.0f, float spacing_w = -1.0f); # call between widgets or groups to layout them horizontally
    #void Spacing(); # add spacing
    #void Dummy(const ImVec2& size); # add a dummy item of given size
    #void Indent(); # move content position toward the right by style.IndentSpacing pixels
    #void Unindent(); # move content position back to the left (cancel Indent)
    #void Columns(int count = 1, const char* id = NULL, bool border=true);    # setup number of columns. use an identifier to distinguish multiple column sets. close with Columns(1).
    #void NextColumn(); # next column
    #int GetColumnIndex(); # get current column index
    #float GetColumnOffset(int column_index = -1); # get position of column line (in pixels, from the left side of the contents region). pass -1 to use current column, otherwise 0..GetcolumnsCount() inclusive. column 0 is usually 0.0f and not resizable unless you call this
    #void SetColumnOffset(int column_index, float offset_x); # set position of column line (in pixels, from the left side of the contents region). pass -1 to use current column
    #float GetColumnWidth(int column_index = -1); # column width (== GetColumnOffset(GetColumnIndex()+1) - GetColumnOffset(GetColumnOffset())
    #int GetColumnsCount(); # number of columns (what was passed to Columns())
    #ImVec2 GetCursorPos(); # cursor position is relative to window position
    #float GetCursorPosX(); # "
    #float GetCursorPosY(); # "
    #void SetCursorPos(const ImVec2& local_pos); # "
    #void SetCursorPosX(float x); # "
    #void SetCursorPosY(float y); # "
    #ImVec2 GetCursorStartPos(); # initial cursor position
    #ImVec2 GetCursorScreenPos(); # cursor position in absolute screen coordinates [0..io.DisplaySize]
    #void SetCursorScreenPos(const ImVec2& pos); # cursor position in absolute screen coordinates [0..io.DisplaySize]
    #void AlignFirstTextHeightToWidgets(); # call once if the first item on the line is a Text() item and you want to vertically lower it to match subsequent (bigger) widgets
    #float GetTextLineHeight(); # height of font == GetWindowFontSize()
    #float GetTextLineHeightWithSpacing(); # distance (in pixels) between 2 consecutive lines of text == GetWindowFontSize() + GetStyle().ItemSpacing.y
    #float GetItemsLineHeightWithSpacing(); # distance (in pixels) between 2 consecutive lines of standard height widgets == GetWindowFontSize() + GetStyle().FramePadding.y*2 + GetStyle().ItemSpacing.y

    ## ID scopes
    ## If you are creating widgets in a loop you most likely want to push a unique identifier so ImGui can differentiate them.
    ## You can also use "##extra" within your widget name to distinguish them from each others. Read the FAQ for more details.
    #void PushID(const char* str_id); # push identifier into the ID stack. IDs are hash of the *entire* stack!
    #void PushID(const char* str_id_begin, const char* str_id_end);
    #void PushID(const void* ptr_id);
    #void PushID(int int_id);
    #void PopID();
    #ImGuiID GetID(const char* str_id); # calculate unique ID (hash of whole ID stack + given parameter). useful if you want to query into ImGuiStorage yourself. otherwise rarely needed
    #ImGuiID GetID(const char* str_id_begin, const char* str_id_end);
    #ImGuiID GetID(const void* ptr_id);

    ## Widgets
    #void Text(const char* fmt, ...) IM_PRINTFARGS(1);
    #void TextV(const char* fmt, va_list args);
    #void TextColored(const ImVec4& col, const char* fmt, ...) IM_PRINTFARGS(2);  # shortcut for PushStyleColor(ImGuiCol_Text, col); Text(fmt, ...); PopStyleColor();
    #void TextColoredV(const ImVec4& col, const char* fmt, va_list args);
    #void TextDisabled(const char* fmt, ...) IM_PRINTFARGS(1); # shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();
    #void TextDisabledV(const char* fmt, va_list args);
    #void TextWrapped(const char* fmt, ...) IM_PRINTFARGS(1); # shortcut for PushTextWrapPos(0.0f); Text(fmt, ...); PopTextWrapPos();. Note that this won't work on an auto-resizing window if there's no other widgets to extend the window width, yoy may need to set a size using SetNextWindowSize().
    #void TextWrappedV(const char* fmt, va_list args);
    #void TextUnformatted(const char* text, const char* text_end = NULL); # doesn't require null terminated string if 'text_end' is specified. no copy done to any bounded stack buffer, recommended for long chunks of text
    #void LabelText(const char* label, const char* fmt, ...) IM_PRINTFARGS(2);    # display text+label aligned the same way as value+label widgets
    #void LabelTextV(const char* label, const char* fmt, va_list args);
    #void Bullet();
    #void BulletText(const char* fmt, ...) IM_PRINTFARGS(1);
    #void BulletTextV(const char* fmt, va_list args);
    #bool Button(const char* label, const ImVec2& size = ImVec2(0,0));
    #bool SmallButton(const char* label);
    #bool InvisibleButton(const char* str_id, const ImVec2& size);
    #void Image(ImTextureID user_texture_id, const ImVec2& size, const ImVec2& uv0 = ImVec2(0,0), const ImVec2& uv1 = ImVec2(1,1), const ImVec4& tint_col = ImVec4(1,1,1,1), const ImVec4& border_col = ImVec4(0,0,0,0));
    #bool ImageButton(ImTextureID user_texture_id, const ImVec2& size, const ImVec2& uv0 = ImVec2(0,0),  const ImVec2& uv1 = ImVec2(1,1), int frame_padding = -1, const ImVec4& bg_col = ImVec4(0,0,0,0), const ImVec4& tint_col = ImVec4(1,1,1,1));    # <0 frame_padding uses default frame padding settings. 0 for no padding
    #bool CollapsingHeader(const char* label, const char* str_id = NULL, bool display_frame = true, bool default_open = false);
    #bool Checkbox(const char* label, bool* v);
    #bool CheckboxFlags(const char* label, unsigned int* flags, unsigned int flags_value);
    #bool RadioButton(const char* label, bool active);
    #bool RadioButton(const char* label, int* v, int v_button);
    #bool Combo(const char* label, int* current_item, const char** items, int items_count, int height_in_items = -1);
    #bool Combo(const char* label, int* current_item, const char* items_separated_by_zeros, int height_in_items = -1); # separate items with \0, end item-list with \0\0
    #bool Combo(const char* label, int* current_item, bool (*items_getter)(void* data, int idx, const char** out_text), void* data, int items_count, int height_in_items = -1);
    #bool ColorButton(const ImVec4& col, bool small_height = false, bool outline_border = true);
    #bool ColorEdit3(const char* label, float col[3]);
    #bool ColorEdit4(const char* label, float col[4], bool show_alpha = true);
    #void ColorEditMode(ImGuiColorEditMode mode);
    #void PlotLines(const char* label, const float* values, int values_count, int values_offset = 0, const char* overlay_text = NULL, float scale_min = FLT_MAX, float scale_max = FLT_MAX, ImVec2 graph_size = ImVec2(0,0), int stride = sizeof(float));
    #void PlotLines(const char* label, float (*values_getter)(void* data, int idx), void* data, int values_count, int values_offset = 0, const char* overlay_text = NULL, float scale_min = FLT_MAX, float scale_max = FLT_MAX, ImVec2 graph_size = ImVec2(0,0));
    #void PlotHistogram(const char* label, const float* values, int values_count, int values_offset = 0, const char* overlay_text = NULL, float scale_min = FLT_MAX, float scale_max = FLT_MAX, ImVec2 graph_size = ImVec2(0,0), int stride = sizeof(float));
    #void PlotHistogram(const char* label, float (*values_getter)(void* data, int idx), void* data, int values_count, int values_offset = 0, const char* overlay_text = NULL, float scale_min = FLT_MAX, float scale_max = FLT_MAX, ImVec2 graph_size = ImVec2(0,0));

    ## Widgets: Drags (tip: ctrl+click on a drag box to input text)
    #bool DragFloat(const char* label, float* v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, const char* display_format = "%.3f", float power = 1.0f); # If v_min >= v_max we have no bound
    #bool DragFloat2(const char* label, float v[2], float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, const char* display_format = "%.3f", float power = 1.0f);
    #bool DragFloat3(const char* label, float v[3], float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, const char* display_format = "%.3f", float power = 1.0f);
    #bool DragFloat4(const char* label, float v[4], float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, const char* display_format = "%.3f", float power = 1.0f);
    #bool DragFloatRange2(const char* label, float* v_current_min, float* v_current_max, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, const char* display_format = "%.3f", const char* display_format_max = NULL, float power = 1.0f);
    #bool DragInt(const char* label, int* v, float v_speed = 1.0f, int v_min = 0, int v_max = 0, const char* display_format = "%.0f"); # If v_min >= v_max we have no bound
    #bool DragInt2(const char* label, int v[2], float v_speed = 1.0f, int v_min = 0, int v_max = 0, const char* display_format = "%.0f");
    #bool DragInt3(const char* label, int v[3], float v_speed = 1.0f, int v_min = 0, int v_max = 0, const char* display_format = "%.0f");
    #bool DragInt4(const char* label, int v[4], float v_speed = 1.0f, int v_min = 0, int v_max = 0, const char* display_format = "%.0f");
    #bool DragIntRange2(const char* label, int* v_current_min, int* v_current_max, float v_speed = 1.0f, int v_min = 0, int v_max = 0, const char* display_format = "%.0f", const char* display_format_max = NULL);

    ## Widgets: Input
    #bool InputText(const char* label, char* buf, size_t buf_size, ImGuiInputTextFlags flags = 0, ImGuiTextEditCallback callback = NULL, void* user_data = NULL);
    #bool InputTextMultiline(const char* label, char* buf, size_t buf_size, const ImVec2& size = ImVec2(0,0), ImGuiInputTextFlags flags = 0, ImGuiTextEditCallback callback = NULL, void* user_data = NULL);
    #bool InputFloat(const char* label, float* v, float step = 0.0f, float step_fast = 0.0f, int decimal_precision = -1, ImGuiInputTextFlags extra_flags = 0);
    #bool InputFloat2(const char* label, float v[2], int decimal_precision = -1, ImGuiInputTextFlags extra_flags = 0);
    #bool InputFloat3(const char* label, float v[3], int decimal_precision = -1, ImGuiInputTextFlags extra_flags = 0);
    #bool InputFloat4(const char* label, float v[4], int decimal_precision = -1, ImGuiInputTextFlags extra_flags = 0);
    #bool InputInt(const char* label, int* v, int step = 1, int step_fast = 100, ImGuiInputTextFlags extra_flags = 0);
    #bool InputInt2(const char* label, int v[2], ImGuiInputTextFlags extra_flags = 0);
    #bool InputInt3(const char* label, int v[3], ImGuiInputTextFlags extra_flags = 0);
    #bool InputInt4(const char* label, int v[4], ImGuiInputTextFlags extra_flags = 0);

    ## Widgets: Sliders (tip: ctrl+click on a slider to input text)
    #bool SliderFloat(const char* label, float* v, float v_min, float v_max, const char* display_format = "%.3f", float power = 1.0f); # adjust display_format to decorate the value with a prefix or a suffix. Use power!=1.0 for logarithmic sliders
    #bool SliderFloat2(const char* label, float v[2], float v_min, float v_max, const char* display_format = "%.3f", float power = 1.0f);
    #bool SliderFloat3(const char* label, float v[3], float v_min, float v_max, const char* display_format = "%.3f", float power = 1.0f);
    #bool SliderFloat4(const char* label, float v[4], float v_min, float v_max, const char* display_format = "%.3f", float power = 1.0f);
    #bool SliderAngle(const char* label, float* v_rad, float v_degrees_min = -360.0f, float v_degrees_max = +360.0f);
    #bool SliderInt(const char* label, int* v, int v_min, int v_max, const char* display_format = "%.0f");
    #bool SliderInt2(const char* label, int v[2], int v_min, int v_max, const char* display_format = "%.0f");
    #bool SliderInt3(const char* label, int v[3], int v_min, int v_max, const char* display_format = "%.0f");
    #bool SliderInt4(const char* label, int v[4], int v_min, int v_max, const char* display_format = "%.0f");
    #bool VSliderFloat(const char* label, const ImVec2& size, float* v, float v_min, float v_max, const char* display_format = "%.3f", float power = 1.0f);
    #bool VSliderInt(const char* label, const ImVec2& size, int* v, int v_min, int v_max, const char* display_format = "%.0f");

    ## Widgets: Trees
    #bool TreeNode(const char* str_label_id); # if returning 'true' the node is open and the user is responsible for calling TreePop()
    #bool TreeNode(const char* str_id, const char* fmt, ...) IM_PRINTFARGS(2);    # "
    #bool TreeNode(const void* ptr_id, const char* fmt, ...) IM_PRINTFARGS(2);    # "
    #bool TreeNodeV(const char* str_id, const char* fmt, va_list args); # "
    #bool TreeNodeV(const void* ptr_id, const char* fmt, va_list args); # "
    #void TreePush(const char* str_id = NULL); # already called by TreeNode(), but you can call Push/Pop yourself for layouting purpose
    #void TreePush(const void* ptr_id = NULL); # "
    #void TreePop();
    #void SetNextTreeNodeOpened(bool opened, ImGuiSetCond cond = 0); # set next tree node to be opened.

    ## Widgets: Selectable / Lists
    #bool Selectable(const char* label, bool selected = false, ImGuiSelectableFlags flags = 0, const ImVec2& size = ImVec2(0,0));  # size.x==0.0: use remaining width, size.x>0.0: specify width. size.y==0.0: use label height, size.y>0.0: specify height
    #bool Selectable(const char* label, bool* p_selected, ImGuiSelectableFlags flags = 0, const ImVec2& size = ImVec2(0,0));
    #bool ListBox(const char* label, int* current_item, const char** items, int items_count, int height_in_items = -1);
    #bool ListBox(const char* label, int* current_item, bool (*items_getter)(void* data, int idx, const char** out_text), void* data, int items_count, int height_in_items = -1);
    #bool ListBoxHeader(const char* label, const ImVec2& size = ImVec2(0,0)); # use if you want to reimplement ListBox() will custom data or interactions. make sure to call ListBoxFooter() afterwards.
    #bool ListBoxHeader(const char* label, int items_count, int height_in_items = -1); # "
    #void ListBoxFooter(); # terminate the scrolling region

    ## Widgets: Value() Helpers. Output single value in "name: value" format (tip: freely declare more in your code to handle your types. you can add functions to the ImGui namespace)
    #void Value(const char* prefix, bool b);
    #void Value(const char* prefix, int v);
    #void Value(const char* prefix, unsigned int v);
    #void Value(const char* prefix, float v, const char* float_format = NULL);
    #void Color(const char* prefix, const ImVec4& v);
    #void Color(const char* prefix, unsigned int v);

    ## Tooltip
    #void SetTooltip(const char* fmt, ...) IM_PRINTFARGS(1); # set tooltip under mouse-cursor, typically use with ImGui::IsHovered(). last call wins
    #void SetTooltipV(const char* fmt, va_list args);
    #void BeginTooltip(); # use to create full-featured tooltip windows that aren't just text
    #void EndTooltip();

    ## Menus
    #bool BeginMainMenuBar(); # create and append to a full screen menu-bar. only call EndMainMenuBar() if this returns true!
    #void EndMainMenuBar();
    #bool BeginMenuBar(); # append to menu-bar of current window (requires ImGuiWindowFlags_MenuBar flag set). only call EndMenuBar() if this returns true!
    #void EndMenuBar();
    #bool BeginMenu(const char* label, bool enabled = true); # create a sub-menu entry. only call EndMenu() if this returns true!
    #void EndMenu();
    #bool MenuItem(const char* label, const char* shortcut = NULL, bool selected = false, bool enabled = true);  # return true when activated. shortcuts are displayed for convenience but not processed by ImGui at the moment
    #bool MenuItem(const char* label, const char* shortcut, bool* p_selected, bool enabled = true); # return true when activated + toggle (*p_selected) if p_selected != NULL

    ## Popup
    #void OpenPopup(const char* str_id); # mark popup as open. popup identifiers are relative to the current ID-stack (so OpenPopup and BeginPopup needs to be at the same level). close childs popups if any. will close popup when user click outside, or activate a pressable item, or CloseCurrentPopup() is called within a BeginPopup()/EndPopup() block.
    #bool BeginPopup(const char* str_id); # return true if popup if opened and start outputting to it. only call EndPopup() if BeginPopup() returned true!
    #bool BeginPopupModal(const char* name, bool* p_opened = NULL, ImGuiWindowFlags extra_flags = 0); # modal dialog (can't close them by clicking outside)
    #bool BeginPopupContextItem(const char* str_id, int mouse_button = 1); # helper to open and begin popup when clicked on last item
    #bool BeginPopupContextWindow(bool also_over_items = true, const char* str_id = NULL, int mouse_button = 1);  # helper to open and begin popup when clicked on current window
    #bool BeginPopupContextVoid(const char* str_id = NULL, int mouse_button = 1); # helper to open and begin popup when clicked in void (no window)
    #void EndPopup();
    #void CloseCurrentPopup(); # close the popup we have begin-ed into. clicking on a MenuItem or Selectable automatically close the current popup.

    ## Logging: all text output from interface is redirected to tty/file/clipboard. Tree nodes are automatically opened.
    #void LogToTTY(int max_depth = -1); # start logging to tty
    #void LogToFile(int max_depth = -1, const char* filename = NULL); # start logging to file
    #void LogToClipboard(int max_depth = -1); # start logging to OS clipboard
    #void LogFinish(); # stop logging (close file, etc.)
    #void LogButtons(); # helper to display buttons for logging to tty/file/clipboard
    #void LogText(const char* fmt, ...) IM_PRINTFARGS(1); # pass text data straight to log (without being displayed)

    ## Utilities
    #bool IsItemHovered(); # was the last item hovered by mouse?
    #bool IsItemHoveredRect(); # was the last item hovered by mouse? even if another item is active while we are hovering this
    #bool IsItemActive(); # was the last item active? (e.g. button being held, text field being edited- items that don't interact will always return false)
    #bool IsItemVisible(); # was the last item visible? (aka not out of sight due to clipping/scrolling.)
    #bool IsAnyItemHovered();
    #bool IsAnyItemActive();
    #ImVec2 GetItemRectMin(); # get bounding rect of last item in screen space
    #ImVec2 GetItemRectMax(); # "
    #ImVec2 GetItemRectSize(); # "
    #bool IsWindowHovered(); # is current window hovered and hoverable (not blocked by a popup) (differentiate child windows from each others)
    #bool IsWindowFocused(); # is current window focused
    #bool IsRootWindowFocused(); # is current root window focused (top parent window in case of child windows)
    #bool IsRootWindowOrAnyChildFocused(); # is current root window or any of its child (including current window) focused
    #bool IsRectVisible(const ImVec2& size); # test if rectangle of given size starting from cursor pos is visible (not clipped). to perform coarse clipping on user's side (as an optimization)
    #bool IsPosHoveringAnyWindow(const ImVec2& pos); # is given position hovering any active imgui window
    #float GetTime();
    #int GetFrameCount();
    #const char*   GetStyleColName(ImGuiCol idx);
    #ImVec2 CalcItemRectClosestPoint(const ImVec2& pos, bool on_edge = false, float outward = +0.0f);   # utility to find the closest point the last item bounding rectangle edge. useful to visually link items
    #ImVec2 CalcTextSize(const char* text, const char* text_end = NULL, bool hide_text_after_double_hash = false, float wrap_width = -1.0f);
    #void CalcListClipping(int items_count, float items_height, int* out_items_display_start, int* out_items_display_end);    # calculate coarse clipping for large list of evenly sized items. Prefer using the ImGuiListClipper higher-level helper if you can.

    #bool BeginChildFrame(ImGuiID id, const ImVec2& size, ImGuiWindowFlags extra_flags = 0);	# helper to create a child window / scrolling region that looks like a normal widget frame
    #void EndChildFrame();

    #ImVec4 ColorConvertU32ToFloat4(ImU32 in);
    #ImU32 ColorConvertFloat4ToU32(const ImVec4& in);
    #void ColorConvertRGBtoHSV(float r, float g, float b, float& out_h, float& out_s, float& out_v);
    #void ColorConvertHSVtoRGB(float h, float s, float v, float& out_r, float& out_g, float& out_b);

    ## Inputs
    #int GetKeyIndex(ImGuiKey key); # map ImGuiKey_* values into user's key index. == io.KeyMap[key]
    #bool IsKeyDown(int key_index); # key_index into the keys_down[] array, imgui doesn't know the semantic of each entry, uses your own indices!
    #bool IsKeyPressed(int key_index, bool repeat = true); # uses user's key indices as stored in the keys_down[] array. if repeat=true. uses io.KeyRepeatDelay / KeyRepeatRate
    #bool IsKeyReleased(int key_index); # "
    #bool IsMouseDown(int button); # is mouse button held
    #bool IsMouseClicked(int button, bool repeat = false); # did mouse button clicked (went from !Down to Down)
    #bool IsMouseDoubleClicked(int button); # did mouse button double-clicked. a double-click returns false in IsMouseClicked(). uses io.MouseDoubleClickTime.
    #bool IsMouseReleased(int button); # did mouse button released (went from Down to !Down)
    #bool IsMouseHoveringWindow(); # is mouse hovering current window ("window" in API names always refer to current window). disregarding of any consideration of being blocked by a popup. (unlike IsWindowHovered() this will return true even if the window is blocked because of a popup)
    #bool IsMouseHoveringAnyWindow(); # is mouse hovering any visible window
    #bool IsMouseHoveringRect(const ImVec2& pos_min, const ImVec2& pos_max, bool clip = true);  # is mouse hovering given bounding rect (in screen space). clipped by current clipping settings. disregarding of consideration of focus/window ordering/blocked by a popup.
    #bool IsMouseDragging(int button = 0, float lock_threshold = -1.0f); # is mouse dragging. if lock_threshold < -1.0f uses io.MouseDraggingThreshold
    #ImVec2 GetMousePos(); # shortcut to ImGui::GetIO().MousePos provided by user, to be consistent with other calls
    #ImVec2 GetMousePosOnOpeningCurrentPopup(); # retrieve backup of mouse positioning at the time of opening popup we have BeginPopup() into
    #ImVec2 GetMouseDragDelta(int button = 0, float lock_threshold = -1.0f);    # dragging amount since clicking. if lock_threshold < -1.0f uses io.MouseDraggingThreshold
    #void ResetMouseDragDelta(int button = 0); #
    #ImGuiMouseCursor GetMouseCursor(); # get desired cursor type, reset in ImGui::NewFrame(), this updated during the frame. valid before Render(). If you use software rendering by setting io.MouseDrawCursor ImGui will render those for you
    #void SetMouseCursor(ImGuiMouseCursor type); # set desired cursor type
    #void CaptureKeyboardFromApp(); # manually enforce imgui setting the io.WantCaptureKeyboard flag next frame (your application needs to handle it). e.g. capture keyboard when your widget is being hovered.
    #void CaptureMouseFromApp(); # manually enforce imgui setting the io.WantCaptureMouse flag next frame (your application needs to handle it).

    ## Helpers functions to access functions pointers in ImGui::GetIO()
    #void* MemAlloc(size_t sz);
    #void MemFree(void* ptr);
    #const char*   GetClipboardText();
    #void SetClipboardText(const char* text);

    ## Internal state/context access - if you want to use multiple ImGui context, or share context between modules (e.g. DLL), or allocate the memory yourself
    #const char*   GetVersion();
    #void* GetInternalState();
    #size_t GetInternalStateSize();
    #void SetInternalState(void* state, bool construct = false);


