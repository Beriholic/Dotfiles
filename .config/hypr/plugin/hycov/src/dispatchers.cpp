#include <optional>

#include <hyprland/src/Compositor.hpp>
#include <hyprland/src/plugins/PluginAPI.hpp>

#include "dispatchers.hpp"
#include "globals.hpp"

bool isDirection(const std::string& arg) {
    return arg == "l" || arg == "r" || arg == "u" || arg == "d" || arg == "left" || arg == "right" || arg == "up" || arg == "down";
}

std::optional<ShiftDirection> parseShiftArg(std::string arg) {
	if (arg == "l" || arg == "left") return ShiftDirection::Left;
	else if (arg == "r" || arg == "right") return ShiftDirection::Right;
	else if (arg == "u" || arg == "up") return ShiftDirection::Up;
	else if (arg == "d" || arg == "down") return ShiftDirection::Down;
	else return {};
}

CWindow  *direction_select(std::string arg){
	CWindow *tempCWindows[100];
	CWindow *tc =  g_pCompositor->m_pLastWindow;
	CWindow *tempFocusCWindows = nullptr;
	int last = -1;
	if(!tc){
		return nullptr;
	}else if (tc->m_bIsFullscreen){
		return nullptr;
	}

    if (!isDirection(arg)) {
        hycov_log(ERR, "Cannot move focus in direction {}, unsupported direction. Supported: l/left,r/right,u/up,d/down", arg);
        return nullptr;
    }

    for (auto &w : g_pCompositor->m_vWindows)
    {
        if (tc == w.get() || tc->m_iWorkspaceID !=w.get()->m_iWorkspaceID || w->isHidden() || !w->m_bIsMapped || w->m_bFadingOut || w->m_bIsFullscreen)
            continue;
			last++;
			tempCWindows[last] = w.get();			
    }
	
  	if (last < 0)
  	  return nullptr;
  	int sel_x = tc->m_vRealPosition.goalv().x;
  	int sel_y = tc->m_vRealPosition.goalv().y;
  	long long int distance = LLONG_MAX;
  	// int temp_focus = 0;

	auto values = CVarList(arg);
	auto shift = parseShiftArg(values[0]);
  	switch (shift.value()) {
  	case ShiftDirection::Up:
  	  for (int _i = 0; _i <= last; _i++) {
  	    if (tempCWindows[_i]->m_vRealPosition.goalv().y < sel_y && tempCWindows[_i]->m_vRealPosition.goalv().x == sel_x) {
  	      int dis_x = tempCWindows[_i]->m_vRealPosition.goalv().x - sel_x;
  	      int dis_y = tempCWindows[_i]->m_vRealPosition.goalv().y - sel_y;
  	      long long int tmp_distance = dis_x * dis_x + dis_y * dis_y; 
  	      if (tmp_distance < distance) {
  	        distance = tmp_distance;
  	        tempFocusCWindows = tempCWindows[_i];
  	      }
  	    }
  	  }
	  if(!tempFocusCWindows){
  	  	for (int _i = 0; _i <= last; _i++) {
  	  	  if (tempCWindows[_i]->m_vRealPosition.goalv().y < sel_y ) {
  	  	    int dis_x = tempCWindows[_i]->m_vRealPosition.goalv().x - sel_x;
  	  	    int dis_y = tempCWindows[_i]->m_vRealPosition.goalv().y - sel_y;
  	  	    long long int tmp_distance = dis_x * dis_x + dis_y * dis_y; 
  	  	    if (tmp_distance < distance) {
  	  	      distance = tmp_distance;
  	  	      tempFocusCWindows = tempCWindows[_i];
  	  	    }
  	  	  }
  	  	}		
	  }
  	  break;
  	case ShiftDirection::Down:
  	  for (int _i = 0; _i <= last; _i++) {
  	    if (tempCWindows[_i]->m_vRealPosition.goalv().y > sel_y && tempCWindows[_i]->m_vRealPosition.goalv().x == sel_x) {
  	      int dis_x = tempCWindows[_i]->m_vRealPosition.goalv().x - sel_x;
  	      int dis_y = tempCWindows[_i]->m_vRealPosition.goalv().y - sel_y;
  	      long long int tmp_distance = dis_x * dis_x + dis_y * dis_y; 
  	      if (tmp_distance < distance) {
  	        distance = tmp_distance;
  	        tempFocusCWindows = tempCWindows[_i];
  	      }
  	    }
  	  }
	  if(!tempFocusCWindows){
  	  	for (int _i = 0; _i <= last; _i++) {
  	  	  if (tempCWindows[_i]->m_vRealPosition.goalv().y > sel_y ) {
  	  	    int dis_x = tempCWindows[_i]->m_vRealPosition.goalv().x - sel_x;
  	  	    int dis_y = tempCWindows[_i]->m_vRealPosition.goalv().y - sel_y;
  	  	    long long int tmp_distance = dis_x * dis_x + dis_y * dis_y; 
  	  	    if (tmp_distance < distance) {
  	  	      distance = tmp_distance;
  	  	      tempFocusCWindows = tempCWindows[_i];
  	  	    }
  	  	  }
  	  	}		
	  }
  	  break;
  	case ShiftDirection::Left:
  	  for (int _i = 0; _i <= last; _i++) {
  	    if (tempCWindows[_i]->m_vRealPosition.goalv().x < sel_x && tempCWindows[_i]->m_vRealPosition.goalv().y == sel_y) {
  	      int dis_x = tempCWindows[_i]->m_vRealPosition.goalv().x - sel_x;
  	      int dis_y = tempCWindows[_i]->m_vRealPosition.goalv().y - sel_y;
  	      long long int tmp_distance = dis_x * dis_x + dis_y * dis_y; 
  	      if (tmp_distance < distance) {
  	        distance = tmp_distance;
  	        tempFocusCWindows = tempCWindows[_i];
  	      }
  	    }
  	  }
	  if(!tempFocusCWindows){
  	  	for (int _i = 0; _i <= last; _i++) {
  	  	  if (tempCWindows[_i]->m_vRealPosition.goalv().x < sel_x) {
  	  	    int dis_x = tempCWindows[_i]->m_vRealPosition.goalv().x - sel_x;
  	  	    int dis_y = tempCWindows[_i]->m_vRealPosition.goalv().y - sel_y;
  	  	    long long int tmp_distance = dis_x * dis_x + dis_y * dis_y; 
  	  	    if (tmp_distance < distance) {
  	  	      distance = tmp_distance;
  	  	      tempFocusCWindows = tempCWindows[_i];
  	  	    }
  	  	  }
  	  	}		
	  }
  	  break;
  	case ShiftDirection::Right:
  	  for (int _i = 0; _i <= last; _i++) {
  	    if (tempCWindows[_i]->m_vRealPosition.goalv().x > sel_x  && tempCWindows[_i]->m_vRealPosition.goalv().y == sel_y) {
  	      int dis_x = tempCWindows[_i]->m_vRealPosition.goalv().x - sel_x;
  	      int dis_y = tempCWindows[_i]->m_vRealPosition.goalv().y - sel_y;
  	      long long int tmp_distance = dis_x * dis_x + dis_y * dis_y; 
  	      if (tmp_distance < distance) {
  	        distance = tmp_distance;
  	        tempFocusCWindows = tempCWindows[_i];
  	      }
  	    }
  	  }
	  if(!tempFocusCWindows){
  	  	for (int _i = 0; _i <= last; _i++) {
  	  	  if (tempCWindows[_i]->m_vRealPosition.goalv().x > sel_x) {
  	  	    int dis_x = tempCWindows[_i]->m_vRealPosition.goalv().x - sel_x;
  	  	    int dis_y = tempCWindows[_i]->m_vRealPosition.goalv().y - sel_y;
  	  	    long long int tmp_distance = dis_x * dis_x + dis_y * dis_y; 
  	  	    if (tmp_distance < distance) {
  	  	      distance = tmp_distance;
  	  	      tempFocusCWindows = tempCWindows[_i];
  	  	    }
  	  	  }
  	  	}		
	  }
  	  break;
  	}
  	return tempFocusCWindows;
}

void dispatch_focusdir(std::string arg)
{
	CWindow *pWindow;
	try {
		pWindow = direction_select(arg);
		if(pWindow){
			g_pCompositor->focusWindow(pWindow);
			g_pCompositor->warpCursorTo(pWindow->middle());
			g_pInputManager->m_pForcedFocus = pWindow;
        	g_pInputManager->simulateMouseMovement();
        	g_pInputManager->m_pForcedFocus = nullptr;
		}
    } catch (std::bad_any_cast& e) { HyprlandAPI::addNotification(PHANDLE, "focusdir", CColor{0.f, 0.5f, 1.f, 1.f}, 5000); }

}

void dispatch_toggleoverview(std::string arg)
{
	hycov_log(LOG,"toggle overview");
	if (isOverView)
	{
		dispatch_leaveoverview(arg);
	}
	else
	{
		dispatch_enteroverview(arg);
	}
}

void dispatch_enteroverview(std::string arg)
{ 
	//ali clients exit fullscreen status before enter overview
	CWindow *PFULLWINDOW;
	CWindow *ActiveWindow = g_pCompositor->m_pLastWindow;
	bool isNoShouldTileWindow = true;

    for (auto &w : g_pCompositor->m_vWindows)
    {
        if (w->isHidden() || !w->m_bIsMapped || w->m_bFadingOut)
            continue;
		isNoShouldTileWindow = false;
	}

	if(isNoShouldTileWindow){
		return;
	}

	hycov_log(LOG,"enter overview");
	isOverView = true;

	for (auto &w : g_pCompositor->m_vWorkspaces)
	{

		if (w.get()->m_bHasFullscreenWindow)
		{
			PFULLWINDOW = g_pCompositor->getFullscreenWindowOnWorkspace(w.get()->m_iID);
			g_pCompositor->setWindowFullscreen(PFULLWINDOW, false, FULLSCREEN_FULL);

			//let overview know it is a fullscreen before
			PFULLWINDOW->m_bIsFullscreen = true;
		}
	}
	//enter overview layout
	g_pLayoutManager->switchToLayout("grid");
	if(ActiveWindow){
		g_pCompositor->focusWindow(ActiveWindow); //restore the focus to before active window
	} else {
		auto node = g_GridLayout->m_lGridNodesData.back();
		g_pCompositor->focusWindow(node.pWindow);
	}

	return;
}

void dispatch_leaveoverview(std::string arg)
{ 
	std::string *configLayoutName = &HyprlandAPI::getConfigValue(PHANDLE, "general:layout")->strValue;

	if(!isOverView){
		return;
	}
	
	hycov_log(LOG,"leave overview");
	isOverView = false;

	if (g_GridLayout->m_lGridNodesData.empty())
	{
		g_pLayoutManager->switchToLayout(*configLayoutName);	
		g_GridLayout->m_lGridNodesData.clear();
		return;
	}

	//move clients to it's original workspace 
	g_GridLayout->moveWindowToSourceWorkspace();
	//jump to target client's workspace
	g_GridLayout->changeToActivceSourceWorkspace();

	for (auto &n : g_GridLayout->m_lGridNodesData)
	{	
		if (n.ovbk_pWindow_isFloating)
		{
			//make floating client restore it's floating status
			n.pWindow->m_bIsFloating = true;
			g_pLayoutManager->getCurrentLayout()->onWindowCreatedFloating(n.pWindow);

			// make floating client restore it's position and size
			n.pWindow->m_vRealSize = n.ovbk_size;
			n.pWindow->m_vRealPosition = n.ovbk_position;

			auto calcPos = n.ovbk_position;
			auto calcSize = n.ovbk_size;

			n.pWindow->m_vRealSize = calcSize;
			n.pWindow->m_vRealPosition = calcPos;

			g_pXWaylandManager->setWindowSize(n.pWindow, calcSize);

		} else if(!n.ovbk_pWindow_isFloating && !n.ovbk_pWindow_isFullscreen) {
			//make floating client restore it's floating status
			// make floating client restore it's position and size
			n.pWindow->m_vRealSize = n.ovbk_size;
			n.pWindow->m_vRealPosition = n.ovbk_position;

			auto calcPos = n.ovbk_position;
			auto calcSize = n.ovbk_size;

			n.pWindow->m_vRealSize = calcSize;
			n.pWindow->m_vRealPosition = calcPos;

			g_pXWaylandManager->setWindowSize(n.pWindow, calcSize);			
		}
	}

	//exit overview layout,go back to old layout
	CWindow *ActiveWindow = g_pCompositor->m_pLastWindow;
	g_pCompositor->focusWindow(nullptr);
	g_pLayoutManager->switchToLayout(*configLayoutName);
	if(ActiveWindow){
		g_pCompositor->focusWindow(ActiveWindow); //restore the focus to before active window
		if(ActiveWindow->m_bIsFloating)
			g_pCompositor->changeWindowZOrder(ActiveWindow, true);

	} else {
		auto node = g_GridLayout->m_lGridNodesData.back();
		g_pCompositor->focusWindow(node.pWindow);
	}
	

	for (auto &n : g_GridLayout->m_lGridNodesData)
	{
		//make all fullscrenn windwo restore it's status
		if (n.ovbk_pWindow_isFullscreen)
		{
			if (n.pWindow != g_pCompositor->m_pLastWindow && n.pWindow->m_iWorkspaceID == g_pCompositor->m_pLastWindow->m_iWorkspaceID)
			{
				continue;
			}	
			g_pCompositor->setWindowFullscreen(n.pWindow, true, n.ovbk_pWindow_m_efFullscreenMode);
		}
	}

	//clean overview layout node date
	g_GridLayout->m_lGridNodesData.clear();

	return;
}

void registerDispatchers()
{
	HyprlandAPI::addDispatcher(PHANDLE, "hycov:enteroverview", dispatch_enteroverview);
	HyprlandAPI::addDispatcher(PHANDLE, "hycov:leaveoverview", dispatch_leaveoverview);
	HyprlandAPI::addDispatcher(PHANDLE, "hycov:toggleoverview", dispatch_toggleoverview);
	HyprlandAPI::addDispatcher(PHANDLE, "hycov:movefocus", dispatch_focusdir);
}