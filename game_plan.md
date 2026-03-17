# Gallery Thief - Game Jam Plan

---

## File Structure

```
project/
|
+-- globals/
|   +-- game_manager.gd
|   +-- signal_hub.gd
|
+-- game/
|   +-- game.tscn
|   +-- game.gd
|
+-- camera/
|   +-- game_camera.tscn
|   +-- camera_controller.gd
|
+-- gallery/
|   +-- room/
|   |   +-- gallery_room.tscn
|   |   +-- gallery_room.gd
|   +-- painting/
|       +-- painting.tscn
|       +-- painting.gd
|
+-- npc/
|   +-- npc.tscn
|   +-- npc.gd
|   +-- visitor.gd
|   +-- thief.gd
|   +-- guard.gd
|
+-- ui/
|   +-- hud/
|   |   +-- hud.tscn
|   |   +-- hud.gd
|   +-- menu/
|   |   +-- menu.tscn
|   |   +-- menu.gd
|   +-- instructions/
|   |   +-- instructions.tscn
|   |   +-- instructions.gd
|   +-- game_over/
|       +-- game_over.tscn
|       +-- game_over.gd
|
+-- assets/
    +-- sprites/
    +-- audio/
    +-- fonts/
```

---

## Scene Trees

### Game
```
Game
+-- GameCamera
+-- RoomsContainer
|   +-- GalleryRoom_1
|   +-- GalleryRoom_2
|   +-- GalleryRoom_3
+-- NPCContainer
+-- HUD
+-- Menu
+-- Instructions
+-- GameOver
```
- **game.gd** - Manages game states (menu, playing, game over); listens to SignalHub to trigger transitions.
- **game_manager.gd** - Autoload singleton; tracks and mutates game state only (stolen count, wrong arrests, active thief reference).
- **signal_hub.gd** - Autoload singleton; declares all global signals (`painting_stolen`, `suspect_clicked`, `guard_dispatched`, `game_over`). No logic, no state.

---

### GalleryRoom
```
GalleryRoom
+-- Background
+-- SpawnLeft
+-- SpawnRight
+-- PaintingSpawns
    +-- SpawnPoint_1
    +-- SpawnPoint_2
    +-- SpawnPoint_3
    +-- SpawnPoint_4
```
- **gallery_room.gd** - Manages painting instances at spawn points; triggers NPC spawns from SpawnLeft and SpawnRight markers; emits via SignalHub when a painting is removed.

---

### Painting
```
Painting
+-- Sprite
+-- CollisionShape2D
```
- **painting.gd** - Exposes a `steal()` method; plays removal and emits `painting_stolen` on SignalHub.

---

### NPC
```
NPC
+-- Sprite
+-- AnimationPlayer
+-- CollisionShape2D
+-- ClickArea
```
- **npc.gd** - Base class; handles X-axis movement, sprite flipping, and emits `suspect_clicked` on SignalHub when clicked.
- **visitor.gd** - Extends NPC; patrols back and forth randomly; occasionally despawns and re-spawns at another room marker.
- **thief.gd** - Extends NPC; same patrol as visitor; rolls a theft chance when overlapping a painting and calls `steal()` if successful.
- **guard.gd** - Extends NPC; moves in one direction across the full room; on collision with target both continue off-screen and despawn.

---

### GameCamera
```
GameCamera
+-- Camera2D
```
- **camera_controller.gd** - Pans left/right to scan a room; snaps vertically between rooms on up/down input; clamps to room bounds.

---

### HUD
```
HUD (CanvasLayer)
+-- StolenCounter
+-- WrongArrestsCounter
```
- **hud.gd** - Listens to SignalHub; pulls current counts from GameManager and updates counters. No logic.

---

### Menu
```
Menu (CanvasLayer)
+-- StartButton
+-- QuitButton
```
- **menu.gd** - Handles start and quit input; emits via SignalHub to trigger game sequence. Backdrop is the live game scene.

---

### Instructions
```
Instructions (CanvasLayer)
+-- PromptLabel
```
- **instructions.gd** - Steps through a list of prompt strings on click; emits via SignalHub when complete.

---

### GameOver
```
GameOver (CanvasLayer)
+-- ResultText
+-- RestartButton
+-- MenuButton
```
- **game_over.gd** - Listens to SignalHub for game over; reads result from GameManager; handles restart and return to menu.
