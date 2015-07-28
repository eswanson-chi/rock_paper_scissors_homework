class GameController < ApplicationController
  # This action is for the bare domain. You can ignore it.
  def home
    redirect_to("/mockup.html")
  end

  # Your code goes below.

  def play

    @user_move = params["user_move"]

    computer_move = ["rock", "paper", "scissors"]
    @computer_move = computer_move.sample

    m = Move.new

    if @user_move == "rock"
      if @computer_move == "rock"
        @outcome = "You tied!"
        m.user_move=@user_move
        m.computer_move = @computer_move
        m.user_wins = 0
        m.computer_wins = 0
        m.tie = 1
      elsif @computer_move == "paper"
        @outcome = "You lost!"
        m.user_move=@user_move
        m.computer_move = @computer_move
        m.user_wins = 0
        m.computer_wins = 1
        m.tie = 0
      elsif @computer_move == "scissors"
        @outcome = "You won!"
        m.user_move=@user_move
        m.computer_move = @computer_move
        m.user_wins = 1
        m.computer_wins = 0
        m.tie = 0
      end
    elsif @user_move == "paper"
      if @computer_move == "paper"
        @outcome = "You tied!"
        m.user_move=@user_move
        m.computer_move = @computer_move
        m.user_wins = 0
        m.computer_wins = 0
        m.tie = 1
      elsif @computer_move == "scissors"
        @outcome = "You lost!"
        m.user_move=@user_move
        m.computer_move = @computer_move
        m.user_wins = 0
        m.computer_wins = 1
        m.tie = 0
      elsif @computer_move == "rock"
        @outcome = "You won!"
        m.user_move=@user_move
        m.computer_move = @computer_move
        m.user_wins = 1
        m.computer_wins = 0
        m.tie = 0
      end
    elsif @user_move == "scissors"
      if @computer_move == "scissors"
        @outcome = "You tied!"
        m.user_move=@user_move
        m.computer_move = @computer_move
        m.user_wins = 0
        m.computer_wins = 0
        m.tie = 1
      elsif @computer_move == "rock"
        @outcome = "You lost!"
        m.user_move=@user_move
        m.computer_move = @computer_move
        m.user_wins = 0
        m.computer_wins = 1
        m.tie = 0
      elsif @computer_move == "paper"
        @outcome = "You won!"
        m.user_move=@user_move
        m.computer_move = @computer_move
        m.user_wins = 1
        m.computer_wins = 0
        m.tie = 0
      end
    end

    m.save

    @all_moves = Move.all

    @all_count = Move.all.count

    @rock_wins = Move.where({:user_move => "rock", :user_wins => 1}).count
    @rock_loses = Move.where({:user_move => "rock", :computer_wins => 1}).count
    @rock_ties = Move.where({:user_move => "rock", :tie => 1}).count

    @paper_wins = Move.where({:user_move => "paper", :user_wins => 1}).count
    @paper_loses = Move.where({:user_move => "paper", :computer_wins => 1}).count
    @paper_ties = Move.where({:user_move => "paper", :tie => 1}).count

    @scissors_wins = Move.where({:user_move => "scissors", :user_wins => 1}).count
    @scissors_loses = Move.where({:user_move => "scissors", :computer_wins => 1}).count
    @scissors_ties = Move.where({:user_move => "scissors", :tie => 1}).count

    @all_wins = Move.where({:user_wins => 1}).count
    @all_loses = Move.where({:computer_wins => 1}).count
    @all_ties = Move.where({:tie => 1}).count

    render("results.html.erb")
  end

end
