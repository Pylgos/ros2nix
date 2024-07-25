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
        rev = "698eec7e7fb86baa985bc2caf300dc419a3662b7";
        hash = "sha256-zaTsudSNv9531O6wc7T0kAyvKa6gmPRjUloagSgwBNU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_doc";
  version = "1.0.1-4";
  src = sources.fuse_doc;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
