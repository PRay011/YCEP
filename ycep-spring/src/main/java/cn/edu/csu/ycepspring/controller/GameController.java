package cn.edu.csu.ycepspring.controller;

import cn.edu.csu.ycepspring.common.response.CommonResponse;
import cn.edu.csu.ycepspring.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/game")
public class GameController {
    @Autowired
    private GameService gameService;

    @GetMapping("/character/{gameID}")
    public CommonResponse getCharacter(@PathVariable("gameID") int gameId) {
        return CommonResponse.success(gameService.getCharacter(gameId));
    }

    @GetMapping("/startPlot/{gameID}")
    public CommonResponse getStartPlot(@PathVariable("gameID") int gameId, @RequestParam("characterID") int characterId) {
        return CommonResponse.success(gameService.getStartPlot(gameId, characterId));
    }

    @GetMapping("/getInteraction/{gameID}")
    public CommonResponse getInteraction(@PathVariable("gameID") int gameId, @RequestParam("characterID") int characterId, @RequestParam("interactionNumber") int interactionNumber) {
        return CommonResponse.success(gameService.getInteraction(gameId, characterId, interactionNumber));
    }

    @GetMapping("/finishInteraction/{gameID}")
    public CommonResponse getfinishInteraction(@PathVariable("gameID") int gameId, @RequestParam("characterID") int characterId, @RequestParam("interactionNumber") int interactionNumber, @RequestParam("interactionID") int interactionId) {
        return CommonResponse.success(gameService.getfinishInteraction(gameId, characterId, interactionNumber, interactionId));
    }

    @GetMapping("/reinforce/test/{gameId}")
    public CommonResponse getReinforce(@PathVariable("gameId") int gameId) {
        return CommonResponse.success(gameService.getReinforce(gameId));
    }
}
