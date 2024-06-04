
                      Container(
                        padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        height = 42,
                        child = Wrap(
                          spacing: 16.0,
                          children: data.menu
                              .map(
                                (e) => InkWell(
                                  borderRadius: BorderRadius.circular(4),
                                  splashColor: theme.scaffoldBackgroundColor.withOpacity(0.1),
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: theme.hintColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(e.title),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),