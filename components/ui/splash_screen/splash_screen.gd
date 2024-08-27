extends Control


func _enter_tree() -> void:
	$BG.modulate = Color.TRANSPARENT
	var tween: Tween = $".".create_tween()
	tween.tween_property($BG, ^"modulate", Color.WHITE, 1)
	await tween.finished
	tween.stop()
	SceneLoader.new("res://components/ui/main_menu/main_menu.tscn", null, get_tree().current_scene)
	tween = $".".create_tween()
	tween.tween_property($BG/Label, ^"modulate", Color.TRANSPARENT, 0.3)
	await tween.finished
	tween.stop()
	tween = $".".create_tween()
	$BG/Label.text = "Astral Havoc"
	tween.tween_property($BG/Label, ^"modulate", Color.WHITE, 0.3)
	await tween.finished
	tween.stop()
	tween = $".".create_tween()
	tween.tween_property($".", ^"modulate", Color.TRANSPARENT, 0.5)
	await tween.finished
	queue_free()
