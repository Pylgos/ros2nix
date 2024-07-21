{
  makeSetupHook,
  qt5,
  writeScript,
}:

makeSetupHook
  {
    name = "wrap-ros-qt-apps-hook";
    propagatedBuildInputs = [ qt5.wrapQtAppsHook ];
  }
  ./wrap-ros-qt-apps-hook.sh
