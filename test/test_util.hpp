#ifndef ED25519_UTIL_HPP_
#define ED25519_UTIL_HPP_

#include <vector>
#include <string>

inline std::vector<char> HexToBytes(const std::string &hex) {
  std::vector<char> bytes;

  for (unsigned int i = 0; i < hex.length(); i += 2) {
    std::string byteString = hex.substr(i, 2);
    char byte = (char)strtol(byteString.c_str(), NULL, 16);
    bytes.push_back(byte);
  }

  return bytes;
}

#endif //  ED25519_UTIL_HPP_
