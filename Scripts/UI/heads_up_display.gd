extends Control

func update_score_label(input_score: int):
	# Local Variables
	
	# Main update_score_label()
	$"Score Panel/Score Label".text = str(input_score)

## Updates the health bar to represent the percentage parsed through
func update_health_bar(health_percentage: float):
	# Local Variables
	
	# Main update_health_bar()
	$"Health Panel/Health Bar".value = health_percentage
