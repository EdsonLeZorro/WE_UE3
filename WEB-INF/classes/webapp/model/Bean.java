package webapp.model;

import gameapi.Game;
import gameapi.Player;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class Bean {

    Player player;
    Player computeropponent;
    Game game;
    int score = 0;
    
    /**
     * Initializes a new game.
     */
    public Bean() {
        List<Player> playerlist = new ArrayList<Player>();
        
        player = new Player("Super Mario");
        playerlist.add(player);
        computeropponent = new Player("Computer");
        playerlist.add(computeropponent);
        this.game = new Game(playerlist, true);
    }

    /**
     * Returns the time already spent on this game
     * 
     * @return the time already spent on this game
     */
    public String getTime(){
       long milliseconds = game.getSpentTime();
       return String.format("%d min, %d sec",
               TimeUnit.MILLISECONDS.toMinutes(milliseconds),
               (TimeUnit.MILLISECONDS.toSeconds(milliseconds) - 
                TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(milliseconds)))
       );
    }

    /**
     * Specifies whether this game is over or not
     * 
     * @return <code>true</code> if this game is over, <code>false</code> 
     *         otherwise.
     */
    public boolean isGameOver(){
       return game.isGameOver();
    }
    
    /**
     * Returns the rounds already played in this game
     * 
     * @return the rounds already played in this game
     */
    public int getRound(){
        return game.getRound();
    }
    
    /**
     * Returns an unmodifiable list of the players participating in this game
     * 
     * @return an unmodifiable list of the players participating in this game
     */
    public List<Player> getPlayers(){
        return game.getPlayers();
    }
    
    /**
     * Returns the currently leading player
     * 
     * @return the currently leading player
     */
    public Player getLeader(){
        return game.getLeader();
    }
    
    /**
     * Specifies if a counter of a player occupies the field identified by 
     * <code>index</code> and when yes which player's counter occupies it
     * 
     * @param index Index of the field for which should be checked if and which
     *        player's counter occupies it
     * @return number of the player whose counter occupies the field identified
     *         by the given <code>intex</code>, i.e., 1, 2, 3 or 4; or -1
     *         if no counter occupies this field
     */
    public int isFieldOccupied(int index){
        return this.game.getBoardFields().get(index-1).getOccupyingPlayer();
    }
    
    /**
     * Rolls the dice for the player
     */
    public void rollDice(){
        if(isGameOver())
            return;
        this.score = game.rollthedice(player);
    }
    
    /**
     * Returns the score thrown by the player
     * 
     * @return the score thrown by the player
     */
    public int getScore(){
        return this.score;
    }
    
    /**
     * Returns the score of the computer opponent
     * 
     * @return the score of the computer-controlled opponent
     */
    public List<Integer> getOpponentScore(){
        return game.getOpponentScore();
    }
}
