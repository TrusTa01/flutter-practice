void main() {
  final game = Minecraft();

  game.playerMove();
  game.playerBuild();
  game.playerDestroy();
}

class Minecraft {
  int level = 0;

  void playerMove() {
    print('Персонаж двигается');
    level += 1;
  }

  void playerBuild() {
    print('Персонаж строит');
    level += 1;
  }
}

extension MinecraftDestroyMod on Minecraft {
  void playerDestroy() {
    print('Персонаж ломает');
    level += 1;
  }
}
