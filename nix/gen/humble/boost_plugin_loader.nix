{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  python3Packages,
  ros_industrial_cmake_boilerplate,
  substituteSource,
}:
let
  sources = rec {
    boost_plugin_loader = substituteSource {
      src = fetchgit {
        name = "boost_plugin_loader-source";
        url = "https://github.com/tesseract-robotics-release/boost_plugin_loader-release.git";
        rev = "5a80dc29c763973528487223b7ed76b46df32cf9";
        hash = "sha256-1afsK+kiBjKItDgVIlXMFK8S/Z6lzo7R9MWYxDNcgzo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "boost_plugin_loader";
  version = "0.2.2-1";
  src = sources.boost_plugin_loader;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost ros_industrial_cmake_boilerplate ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
