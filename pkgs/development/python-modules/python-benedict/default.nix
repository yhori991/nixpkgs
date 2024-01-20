{ lib
, boto3
, buildPythonPackage
, fetchFromGitHub
, ftfy
, mailchecker
, openpyxl
, orjson
, phonenumbers
, pytestCheckHook
, python-dateutil
, python-decouple
, python-fsutil
, python-slugify
, pythonOlder
, pythonRelaxDepsHook
, pyyaml
, requests
, setuptools
, six
, toml
, xlrd
, xmltodict
}:

buildPythonPackage rec {
  pname = "python-benedict";
  version = "0.33.0";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "fabiocaccamo";
    repo = "python-benedict";
    rev = "refs/tags/${version}";
    hash = "sha256-SJBU7jMnyLBdWQPQ/UGbVklKUOrCM3fMnOkXKHQnyPI=";
  };

  nativeBuildInputs = [
    pythonRelaxDepsHook
    setuptools
  ];

  pythonRelaxDeps = [
    "boto3"
  ];

  propagatedBuildInputs = [
    boto3
    ftfy
    mailchecker
    openpyxl
    phonenumbers
    python-dateutil
    python-fsutil
    python-slugify
    pyyaml
    requests
    toml
    xlrd
    xmltodict
  ];

  nativeCheckInputs = [
    orjson
    pytestCheckHook
    python-decouple
    six
  ];

  disabledTests = [
    # Tests require network access
    "test_from_base64_with_valid_url_valid_content"
    "test_from_html_with_valid_file_valid_content"
    "test_from_html_with_valid_url_valid_content"
    "test_from_json_with_valid_url_valid_content"
    "test_from_pickle_with_valid_url_valid_content"
    "test_from_plist_with_valid_url_valid_content"
    "test_from_query_string_with_valid_url_valid_content"
    "test_from_toml_with_valid_url_valid_content"
    "test_from_xls_with_valid_url_valid_content"
    "test_from_xml_with_valid_url_valid_content"
    "test_from_yaml_with_valid_url_valid_content"
  ];

  pythonImportsCheck = [
    "benedict"
  ];

  meta = with lib; {
    description = "Module with keylist/keypath support";
    homepage = "https://github.com/fabiocaccamo/python-benedict";
    changelog = "https://github.com/fabiocaccamo/python-benedict/blob/${version}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ fab ];
  };
}
