import XMonad

import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.Fullscreen
import XMonad.Layout.WindowNavigation
import XMonad.Layout.ResizableTile
import XMonad.Layout.Renamed

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Util.SpawnOnce

import Graphics.X11.ExtraTypes.XF86

import qualified Data.Map as M
import qualified XMonad.StackSet as W

import System.Exit

---------------------------------------------------------------------------------------------------------------
-- Default settings -------------------------------------------------------------------------------------------

myTerminal :: String
myTerminal = "alacritty"

myWorkspaces :: [WorkspaceId]
myWorkspaces = map show [1 .. 9 :: Int]

myModMask :: KeyMask
myModMask = mod1Mask

myBorderWidth :: Dimension
myBorderWidth = 2

myNormalBorderColor, myFocusedBorderColor :: String
myNormalBorderColor = "#000000"
myFocusedBorderColor = "#2e9ef4"

---------------------------------------------------------------------------------------------------------------
-- Layout Hook ------------------------------------------------------------------------------------------------

myLayoutHook = avoidStruts $ renamed [Replace "Tiled"] tiled ||| renamed [Replace "Full"] full
    where
        tiled = spacing 5 $ windowNavigation $ ResizableTall 1 (1/100) (1/2) []
        full = noBorders Full

---------------------------------------------------------------------------------------------------------------
-- Keybindings ------------------------------------------------------------------------------------------------

myKeys conf@(XConfig { XMonad.modMask = modm }) = M.fromList $
    [
        ((modm, xK_d), spawn "rofi -show drun"),
        ((modm, xK_w), spawn "rofi -show window"),
        ((modm, xK_Return), spawn $ XMonad.terminal conf),
        ((modm, xK_q), kill),

        -- Toggle polybar
        ((modm, xK_p), spawn $ "polybar-msg cmd toggle"),

        -- Toggle layouts
        ((modm, xK_t), withFocused $ windows . W.sink),
        ((modm, xK_m), sendMessage $ JumpToLayout "Tiled"),
        ((modm, xK_f), sendMessage $ JumpToLayout "Full"),
        ((modm, xK_space), sendMessage NextLayout),

        ((modm .|. shiftMask, xK_m), sequence_ [(spawn $ "polybar-msg cmd show"), (sendMessage $ JumpToLayout "Tiled")]),
        ((modm .|. shiftMask, xK_f), sequence_ [(spawn $ "polybar-msg cmd hide"), (sendMessage $ JumpToLayout "Full")]),

        -- Navigate through open windows
        ((modm, xK_h), sendMessage $ Go L),
        ((modm, xK_j), sendMessage $ Go D),
        ((modm, xK_k), sendMessage $ Go U),
        ((modm, xK_l), sendMessage $ Go R),

        -- Swap windows
        ((modm .|. shiftMask, xK_h), sendMessage $ Swap L),
        ((modm .|. shiftMask, xK_j), sendMessage $ Swap D),
        ((modm .|. shiftMask, xK_k), sendMessage $ Swap U),
        ((modm .|. shiftMask, xK_l), sendMessage $ Swap R),

        -- Resize windows
        ((modm .|. controlMask, xK_h), sendMessage Shrink),
        ((modm .|. controlMask, xK_l), sendMessage Expand),
        ((modm .|. controlMask, xK_j), sendMessage MirrorShrink),
        ((modm .|. controlMask, xK_k), sendMessage MirrorExpand),

        -- Change the number of windows in the master area
        ((modm, xK_comma), sendMessage $ IncMasterN(-1)),
        ((modm, xK_period), sendMessage $ IncMasterN(1)),

        -- Manage the media player
        ((0, xF86XK_AudioRaiseVolume), spawn "amixer set Master on && amixer sset Master 5%+"),
        ((0, xF86XK_AudioLowerVolume), spawn "amixer set Master on && amixer sset Master 5%-"),
        ((0, xF86XK_AudioMute), spawn "amixer set Master 1+ toggle"),
        ((0, xF86XK_AudioPlay), spawn "playerctl play-pause"),
        ((0, xF86XK_AudioPrev), spawn "playerctl previous"),
        ((0, xF86XK_AudioNext), spawn "playerctl next"),
        ((0, xF86XK_AudioStop), spawn "playerctl stop"),

        -- Switch keyboard layout
        ((modm, xK_Escape), spawn "~/.local/bin/xkb-switch"),

        -- Take a screenshot
        ((mod4Mask .|. shiftMask, xK_s), spawn "maim -u -s | xclip -selection clipboard -t image/png"),
        ((mod4Mask, xK_s), spawn "maim -u | xclip -selection clipboard -t image/png"),

        -- Restart / Quit XMonad
        ((modm, xK_r), spawn "xmonad --recompile && xmonad --restart"),
        ((modm .|. controlMask, xK_e), io (exitWith ExitSuccess)),

        -- Shut down the machine
        ((modm .|. controlMask, xK_s), spawn "shutdown -h now"),
        ((modm .|. controlMask, xK_r), spawn "reboot")
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

---------------------------------------------------------------------------------------------------------------
-- Startup Hook -----------------------------------------------------------------------------------------------

myStartupHook = do
    spawnOnce "~/.fehbg"
    spawnOnce "picom --config ~/.config/picom/picom.conf"
    spawnOnce "dunst"
    
---------------------------------------------------------------------------------------------------------------
-- Status Bar -------------------------------------------------------------------------------------------------

mySB = statusBarProp "polybar" (pure def {
    ppLayout = const "",
    ppTitle = const "",
    ppVisible = wrap "(" ")"
})

---------------------------------------------------------------------------------------------------------------
-- Main -------------------------------------------------------------------------------------------------------

main :: IO ()
main = xmonad $ 
       ewmh $ withEasySB mySB defToggleStrutsKey $ myConfig

---------------------------------------------------------------------------------------------------------------
-- Config -----------------------------------------------------------------------------------------------------

myConfig = def {
    terminal = myTerminal,
    workspaces = myWorkspaces,
    borderWidth = myBorderWidth,
    normalBorderColor = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,
    modMask = myModMask,
    keys = myKeys,
    layoutHook = myLayoutHook,
    startupHook = myStartupHook
}
