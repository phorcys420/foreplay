#ifndef FLUTTER_MY_APPLICATION_H_
#define FLUTTER_MY_APPLICATION_H_

#include <gtk/gtk.h>

G_DECLARE_FINAL_TYPE(Foreplay, foreplay, FORE, PLAY,
                     GtkApplication)

/**
 * foreplay_new:
 *
 * Creates a new Flutter-based application.
 *
 * Returns: a new #Foreplay.
 */
Foreplay* foreplay_new();

#endif  // FLUTTER_MY_APPLICATION_H_
