{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  sqlite,
  substituteSource,
}:
let
  sources = rec {
    sqlite3_vendor = substituteSource {
      src = fetchgit {
        name = "sqlite3_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "24c95dc8a8d999287e81bb05cd617f8f7284b9f5";
        hash = "sha256-n9AAYcZ2JiNvV8nO5SocHlNxk4lfqDwlB8yWjLNDC8A=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://www.sqlite.org/2018/sqlite-amalgamation-3240000.zip";
          to = "URL ${sqlite3_vendor-vendor_source-sqlite-amalgamation-3240000-0}";
        }
      ];
    };
    sqlite3_vendor-vendor_source-sqlite-amalgamation-3240000-0 = substituteSource {
      src = fetchzip {
        name = "sqlite3_vendor-vendor_source-sqlite-amalgamation-3240000-0-source";
        url = "https://www.sqlite.org/2018/sqlite-amalgamation-3240000.zip";
        hash = "sha256-0NvEoh4gUXGvD2VquiAoqgvx7JgVYU8WUfHzN/z0DNc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sqlite3_vendor";
  version = "0.15.11-1";
  src = sources.sqlite3_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ sqlite ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
