namespace java cn.edu.csu.ycepspring.rpc
namespace py rpc

service AIService {
  string newSession(1: string theme,
                    2: string part),
  string chat(1: string content,
              2: string sessionKey),
  bool resetSession(1: string sessionKey),
  bool closeSession(1: string sessionKey),
  string getBriefAndKeywords(1: string theme,
                             2: string article);
}
