extends Control

var wood = 0
var wood_per_chop = 1
var upgrade_cost = 10
var magical_wood_unlocked = false
var magical_wood = 0
var magical_wood_cost = 100
var passive_income = 0
var passive_timer = 0.0

func _ready():
    $ChopButton.pressed.connect(_on_chop_pressed)
    $UpgradeButton.pressed.connect(_on_upgrade_pressed)
    $UnlockButton.pressed.connect(_on_unlock_pressed)
    update_ui()

func _process(delta):
    if passive_income > 0:
        passive_timer += delta
        $PassiveChopBar.value = passive_timer
        $PassiveChopBar.max_value = 1.0
        if passive_timer > 1.0:
            passive_timer = 0.0
            add_wood(passive_income)
            $PassiveChopBar.value = 0

func _on_chop_pressed():
    add_wood(wood_per_chop)
    if magical_wood_unlocked:
        magical_wood += 1
    update_ui()

func _on_upgrade_pressed():
    if wood >= upgrade_cost:
        wood -= upgrade_cost
        wood_per_chop += 1
        upgrade_cost = int(upgrade_cost * 1.5)
        passive_income += 1
        update_ui()

func _on_unlock_pressed():
    if wood >= magical_wood_cost and not magical_wood_unlocked:
        wood -= magical_wood_cost
        magical_wood_unlocked = true
        update_ui()

func add_wood(amount):
    wood += amount
    update_ui()

func update_ui():
    $WoodCountLabel.text = "Wood: %d" % wood
    if magical_wood_unlocked:
        $UnlockButton.text = "Magical Wood: %d" % magical_wood
    else:
        $UnlockButton.text = "Unlock Magical Wood (%d)" % magical_wood_cost
    $UpgradeButton.text = "Upgrade Axe (%d)" % upgrade_cost
