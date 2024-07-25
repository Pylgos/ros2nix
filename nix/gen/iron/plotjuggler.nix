{
  ament_cmake,
  ament_index_cpp,
  binutils,
  buildRosPackage,
  cppzmq,
  fastcdr,
  fetchgit,
  fetchurl,
  fetchzip,
  lz4,
  protobuf,
  python3Packages,
  qt5,
  rclcpp,
  substituteSource,
  wrapRosQtAppsHook,
  zstd,
}:
let
  sources = rec {
    plotjuggler = substituteSource {
      src = fetchgit {
        name = "plotjuggler-source";
        url = "https://github.com/ros2-gbp/plotjuggler-release.git";
        rev = "1498a409b508852ca46d79d252b5c7db9a028566";
        hash = "sha256-E2Lpnsad5q5aPDsY5WCCyo31y6SxwgD0tXH1zmsfGIo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plotjuggler";
  version = "3.9.0-1";
  src = sources.plotjuggler;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ binutils cppzmq fastcdr lz4 protobuf python3Packages.boost qt5.qtbase qt5.qtsvg qt5.qtwebsockets qt5.qtx11extras rclcpp zstd ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
