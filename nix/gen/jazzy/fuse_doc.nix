{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    fuse_doc = substituteSource {
      src = fetchgit {
        name = "fuse_doc-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "24121e81f24f166c52c66267ea0be8332a1446a5";
        hash = "sha256-uY1vnIJQ0LsiGyvvSWFiqNVyu1/Ag328pzFCn2jhhsQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_doc";
  version = "1.1.1-1";
  src = sources.fuse_doc;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}