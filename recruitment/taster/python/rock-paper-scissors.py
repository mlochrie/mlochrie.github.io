import random


def play_game():
  print("This is the start of our game")
  choices = ["rock", "paper", "scissors"]
  user_score = 0
  computer_score = 0

  while True:
    computer_choice = random.choice(choices)
    user_choice = input(
        "Enter rock, paper, or scissors (or 'exit' to quit): ").lower()
  
    if user_choice == 'exit':
      break
  
    if user_choice not in choices:
      print("Invalid choice. Please try again.")
      continue
  
    print(f"Computer chose: {computer_choice}")
    print(f"You chose: {user_choice}")
  
    if user_choice == computer_choice:
      print("It's a tie!")
    elif (user_choice == "rock" and computer_choice == "scissors") or \
         (user_choice == "paper" and computer_choice == "rock") or \
         (user_choice == "scissors" and computer_choice == "paper"):
      print("You win!")
      user_score += 1
    else:
      print("You lose!")
      computer_score += 1
  
    print(f"Score: You {user_score} - {computer_score} Computer")
  
  print("Thanks for playing!")



if __name__ == "__main__":
  play_game()
