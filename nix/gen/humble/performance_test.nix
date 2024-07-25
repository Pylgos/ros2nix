{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  osrf_testing_tools_cpp,
  rclcpp,
  rmw_implementation,
  rmw_implementation_cmake,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    performance_test = substituteSource {
      src = fetchgit {
        name = "performance_test-source";
        url = "https://github.com/ros2-gbp/performance_test-release.git";
        rev = "25fec55b63cf62d3b5c0be2dc281f9901b7712aa";
        hash = "sha256-u4mAwbA+JRMXmY53Z0E6Uz7BQJcVZkDovcmnVCK1KxU=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY http://git.code.sf.net/p/tclap/code";
          to = "URL ${performance_test-vendor_source-code-0}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/Tencent/rapidjson.git";
          to = "URL ${performance_test-vendor_source-rapidjson-1}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/p-ranav/tabulate.git";
          to = "URL ${performance_test-vendor_source-tabulate-2}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/r-lyeh-archived/sole.git";
          to = "URL ${performance_test-vendor_source-sole-3}";
        }
      ];
    };
    performance_test-vendor_source-code-0 = substituteSource {
      src = fetchgit {
        name = "performance_test-vendor_source-code-0-source";
        url = "http://git.code.sf.net/p/tclap/code";
        rev = "799a8b1f99818e39fee19d0601030770af1221e1";
        hash = "sha256-kdrzAj5C/9AmA8OGntgmq4bAadAFzu6nz2brAddLNIk=";
      };
      substitutions = [
      ];
    };
    performance_test-vendor_source-rapidjson-1 = substituteSource {
      src = fetchgit {
        name = "performance_test-vendor_source-rapidjson-1-source";
        url = "https://github.com/Tencent/rapidjson.git";
        rev = "f54b0e47a08782a6131cc3d60f94d038fa6e0a51";
        hash = "sha256-mFM1Etpf+qF/G0t91eXD8FQXwSQKyQbJq8gUA0jsm4Q=";
      };
      substitutions = [
      ];
    };
    performance_test-vendor_source-sole-3 = substituteSource {
      src = fetchgit {
        name = "performance_test-vendor_source-sole-3-source";
        url = "https://github.com/r-lyeh-archived/sole.git";
        rev = "e4678426147adb9d4f9f978c9560a7d0343b8c32";
        hash = "sha256-HxTUT2NFLkg4MDqN8iIUr/22gXiWV0CKSi1TD0nSazc=";
      };
      substitutions = [
      ];
    };
    performance_test-vendor_source-tabulate-2 = substituteSource {
      src = fetchgit {
        name = "performance_test-vendor_source-tabulate-2-source";
        url = "https://github.com/p-ranav/tabulate.git";
        rev = "57b1032aff2d8b115a56d20c2584170bae0ff852";
        hash = "sha256-yI6KLWjquuxnqXPe9Q4rPTwQv+FBr/EtPJx3fOqg63M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "performance_test";
  version = "1.2.1-1";
  src = sources.performance_test;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ osrf_testing_tools_cpp rclcpp rmw_implementation rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
