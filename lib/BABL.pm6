use v6.c;

use NativeCall;

use GLib::Raw::Types;
use GLib::Roles::Pointers;

use GLib::Roles::StaticClass;

class Babl is repr<CPointer> is export does GLib::Roles::Pointers;

class BABL is export {

  method exit () {
    babl_exit();
  }

  method fast_fish (
    Pointer $source_format,
    Pointer $destination_format,
    Str $performance
  ) {
    babl_fast_fish($source_format, $destination_format, $performance);
  }

  method fish (Pointer $source_format, Pointer $destination_format) {
    babl_fish($source_format, $destination_format);
  }

  method get_name (Babl $babl) {
    babl_get_name($babl);
  }

  method get_user_data (Babl $babl) {
    babl_get_user_data($babl);
  }

  method icc_get_key (
    Str $icc_data,
    gint $icc_length,
    Str $key,
    Str $language,
    Str $country
  ) {
    babl_icc_get_key($icc_data, $icc_length, $key, $language, $country);
  }

  method process (
    Babl $babl_fish,
    Pointer $source,
    Pointer $destination,
    long $n
  ) {
    babl_process($babl_fish, $source, $destination, $n);
  }

  method process_rows (
    Babl $babl_fish,
    Pointer $source,
    gint $source_stride,
    Pointer $dest,
    gint $dest_stride,
    long $n,
    gint $rows
  ) {
    babl_process_rows(
      $babl_fish,
      $source,
      $source_stride,
      $dest,
      $dest_stride,
      $n,
      $rows
    );
  }

  method sampling (gint $horizontal, gint $vertical) {
    babl_sampling($horizontal, $vertical);
  }

  method set_user_data (Babl $babl, Pointer $data) {
    babl_set_user_data($babl, $data);
  }

  method trc (Str $name) {
    babl_trc($name);
  }

  method trc_gamma (gdouble $gamma) {
    babl_trc_gamma($gamma);
  }

  method type (Str $name) {
    babl_type($name);
  }

  method type_new (Pointer $first_arg, ...) {
    babl_type_new($first_arg);
  }

}

class BABL::Component is export {

  method get (Str $name) {
    babl_component($name);
  }

  method new (Pointer $first_arg, ...) {
    babl_component_new($first_arg);
  }

}

class BABL::Conversion is export {

  method get_destination_space (Babl $conversion) {
    babl_conversion_get_destination_space($conversion);
  }

  method get_source_space (Babl $conversion) {
    babl_conversion_get_source_space($conversion);
  }

  method new (Pointer $first_arg, ...) {
    babl_conversion_new($first_arg);
  }

}

class BABL::Format is export {
  also does GLib::Roles::StaticClass;

  method exists (Str $name) {
    babl_format_exists($name);
  }

  method get (Str $encoding) {
    babl_format($encoding);
  }

  method get_bytes_per_pixel (Babl $format) {
    babl_format_get_bytes_per_pixel($format);
  }

  method get_encoding (Babl $babl) {
    babl_format_get_encoding($babl);
  }

  method get_model (Babl $format) {
    babl_format_get_model($format);
  }

  method get_n_components (Babl $format) {
    babl_format_get_n_components($format);
  }

  method get_space (Babl $format) {
    babl_format_get_space($format);
  }

  method get_type (Babl $format, gint $component_index) {
    babl_format_get_type($format, $component_index);
  }

  method has_alpha (Babl $format) {
    babl_format_has_alpha($format);
  }

  method is_format_n (Babl $format) {
    babl_format_is_format_n($format);
  }

  method is_palette (Babl $format) {
    babl_format_is_palette($format);
  }

  method n (Babl $type, gint $components) {
    babl_format_n($type, $components);
  }

  # method new (Pointer $first_arg, ...) {
  #   babl_format_new($first_arg);
  # }

  method with_space (Str $encoding, Babl $space) {
    babl_format_with_space($encoding, $space);
  }

}

class BABL::Model is export {

  method get (Str $name) {
    babl_model($name);
  }

  method is (Babl $babl, Str $model_name) {
    babl_model_is($babl, $model_name);
  }

  method new (Pointer $first_arg, ...) {
    babl_model_new($first_arg);
  }

  method with_space (Str $name, Babl $space) {
    babl_model_with_space($name, $space);
  }

}

class BABL::Palette is export {

  method new (Str $name, Babl $format_u8, Babl $format_u8_with_alpha) {
    babl_new_palette($name, $format_u8, $format_u8_with_alpha);
  }

  method new_palette_with_space (
    Str $name,
    Babl $space,
    Babl $format_u8,
    Babl $format_u8_with_alpha
  ) {
    babl_new_palette_with_space(
      $name,
      $space,
      $format_u8,
      $format_u8_with_alpha
    );
  }

  method reset (Babl $babl) {
    babl_palette_reset($babl);
  }

  method set_palette (Babl $babl, Babl $format, Pointer $data, gint $count) {
    babl_palette_set_palette($babl, $format, $data, $count);
  }

}

class BABL::Space is export {

  method from_chromaticities (
    Str $name,
    gdouble $wx,
    gdouble $wy,
    gdouble $rx,
    gdouble $ry,
    gdouble $gx,
    gdouble $gy,
    gdouble $bx,
    gdouble $by,
    Babl $trc_red,
    Babl $trc_green,
    Babl $trc_blue,
    BablSpaceFlags $flags
  ) {
    babl_space_from_chromaticities(
      $name,
      $wx,
      $wy,
      $rx,
      $ry,
      $gx,
      $gy,
      $bx,
      $by,
      $trc_red,
      $trc_green,
      $trc_blue,
      $flags
    );
  }

  method from_icc (
    Str $icc_data,
    gint $icc_length,
    BablIccIntent $intent,
    Str $error
  ) {
    babl_space_from_icc($icc_data, $icc_length, $intent, $error);
  }

  method from_rgbxyz_matrix (
    Str $name,
    gdouble $wx,
    gdouble $wy,
    gdouble $wz,
    gdouble $rx,
    gdouble $gx,
    gdouble $bx,
    gdouble $ry,
    gdouble $gy,
    gdouble $by,
    gdouble $rz,
    gdouble $gz,
    gdouble $bz,
    Babl $trc_red,
    Babl $trc_green,
    Babl $trc_blue
  ) {
    babl_space_from_rgbxyz_matrix(
      $name,
      $wx,
      $wy,
      $wz,
      $rx,
      $gx,
      $bx,
      $ry,
      $gy,
      $by,
      $rz,
      $gz,
      $bz,
      $trc_red,
      $trc_green,
      $trc_blue
    );
  }

  multi method get (Str $name) {
    babl_space($name);
  }

  multi method get (
    Babl $space,
    gdouble $xw is rw,
    gdouble $yw is rw,
    gdouble $xr is rw,
    gdouble $yr is rw,
    gdouble $xg is rw,
    gdouble $yg is rw,
    gdouble $xb is rw,
    gdouble $yb is rw,
    Babl $red_trc,
    Babl $green_trc,
    Babl $blue_trc
  ) {
    babl_space_get(
      $space,
      $xw,
      $yw,
      $xr,
      $yr,
      $xg,
      $yg,
      $xb,
      $yb,
      $red_trc,
      $green_trc,
      $blue_trc
    );
  }

  method get_icc (Babl $babl, gint $length is rw) {
    babl_space_get_icc($babl, $length is rw);
  }

  method get_rgb_luminance (
    Babl $space,
    gdouble $red_luminance is rw,
    gdouble $green_luminance is rw,
    gdouble $blue_luminance is rw
  ) {
    babl_space_get_rgb_luminance(
      $space,
      $red_luminance,
      $green_luminance,
      $blue_luminance
    );
  }

  method is_cmyk (Babl $space) {
    so babl_space_is_cmyk($space);
  }

  method is_gray (Babl $space) {
    so babl_space_is_gray($space);
  }

  method with_trc (Babl $space, Babl $trc) {
    babl_space_with_trc($space, $trc);
  }

}

# Annoying.
our (\R, \G, \B, \A, \C, \M, \Y, \K) is export = 0 xx 8;

INIT {
  ::("$_") := BABL::Component.new($_) for <R G B A C M Y K>;
}

### /usr/include/babl-0.1/babl/babl.h

sub babl_component (Str $name)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_component_new (Pointer $first_arg, ...)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_conversion_get_destination_space (Babl $conversion)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_conversion_get_source_space (Babl $conversion)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_conversion_new (Pointer $first_arg, ...)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_exit ()
  is native(babl)
  is export
{ * }

sub babl_fast_fish (
  Pointer $source_format,
  Pointer $destination_format,
  Str $performance
)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_fish (Pointer $source_format, Pointer $destination_format)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_format (Str $encoding)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_format_exists (Str $name)
  returns gint
  is native(babl)
  is export
{ * }

sub babl_format_get_bytes_per_pixel (Babl $format)
  returns gint
  is native(babl)
  is export
{ * }

sub babl_format_get_encoding (Babl $babl)
  returns char
  is native(babl)
  is export
{ * }

sub babl_format_get_model (Babl $format)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_format_get_n_components (Babl $format)
  returns gint
  is native(babl)
  is export
{ * }

sub babl_format_get_space (Babl $format)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_format_get_type (Babl $format, gint $component_index)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_format_has_alpha (Babl $format)
  returns gint
  is native(babl)
  is export
{ * }

sub babl_format_is_format_n (Babl $format)
  returns gint
  is native(babl)
  is export
{ * }

sub babl_format_is_palette (Babl $format)
  returns gint
  is native(babl)
  is export
{ * }

sub babl_format_n (Babl $type, gint $components)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_format_new (Pointer $first_arg, ...)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_format_with_space (Str $encoding, Babl $space)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_get_name (Babl $babl)
  returns char
  is native(babl)
  is export
{ * }

sub babl_get_user_data (Babl $babl)
  is native(babl)
  is export
{ * }

sub babl_icc_get_key (
  Str $icc_data,
  gint $icc_length,
  Str $key,
  Str $language,
  Str $country
)
  returns char
  is native(babl)
  is export
{ * }

sub babl_model (Str $name)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_model_is (Babl $babl, Str $model_name)
  returns gint
  is native(babl)
  is export
{ * }

sub babl_model_new (Pointer $first_arg, ...)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_model_with_space (Str $name, Babl $space)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_new_palette (Str $name, Babl $format_u8, Babl $format_u8_with_alpha)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_new_palette_with_space (
  Str $name,
  Babl $space,
  Babl $format_u8,
  Babl $format_u8_with_alpha
)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_palette_reset (Babl $babl)
  is native(babl)
  is export
{ * }

sub babl_palette_set_palette (
  Babl $babl,
  Babl $format,
  Pointer $data,
  gint $count
)
  is native(babl)
  is export
{ * }

sub babl_process (
  Babl $babl_fish,
  Pointer $source,
  Pointer $destination,
  long $n
)
  returns long
  is native(babl)
  is export
{ * }

sub babl_process_rows (
  Babl $babl_fish,
  Pointer $source,
  gint $source_stride,
  Pointer $dest,
  gint $dest_stride,
  long $n,
  gint $rows
)
  returns long
  is native(babl)
  is export
{ * }

sub babl_sampling (gint $horizontal, gint $vertical)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_set_user_data (Babl $babl, Pointer $data)
  is native(babl)
  is export
{ * }

sub babl_space (Str $name)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_space_from_chromaticities (
  Str $name,
  gdouble $wx,
  gdouble $wy,
  gdouble $rx,
  gdouble $ry,
  gdouble $gx,
  gdouble $gy,
  gdouble $bx,
  gdouble $by,
  Babl $trc_red,
  Babl $trc_green,
  Babl $trc_blue,
  BablSpaceFlags $flags
)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_space_from_icc (
  Str $icc_data,
  gint $icc_length,
  BablIccIntent $intent,
  Str $error
)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_space_from_rgbxyz_matrix (
  Str $name,
  gdouble $wx,
  gdouble $wy,
  gdouble $wz,
  gdouble $rx,
  gdouble $gx,
  gdouble $bx,
  gdouble $ry,
  gdouble $gy,
  gdouble $by,
  gdouble $rz,
  gdouble $gz,
  gdouble $bz,
  Babl $trc_red,
  Babl $trc_green,
  Babl $trc_blue
)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_space_get (
  Babl $space,
  gdouble $xw is rw,
  gdouble $yw is rw,
  gdouble $xr is rw,
  gdouble $yr is rw,
  gdouble $xg is rw,
  gdouble $yg is rw,
  gdouble $xb is rw,
  gdouble $yb is rw,
  Babl $red_trc,
  Babl $green_trc,
  Babl $blue_trc
)
  is native(babl)
  is export
{ * }

sub babl_space_get_icc (Babl $babl, gint $length is rw)
  returns char
  is native(babl)
  is export
{ * }

sub babl_space_get_rgb_luminance (
  Babl $space,
  gdouble $red_luminance is rw,
  gdouble $green_luminance is rw,
  gdouble $blue_luminance is rw
)
  is native(babl)
  is export
{ * }

sub babl_space_is_cmyk (Babl $space)
  returns gint
  is native(babl)
  is export
{ * }

sub babl_space_is_gray (Babl $space)
  returns gint
  is native(babl)
  is export
{ * }

sub babl_space_with_trc (Babl $space, Babl $trc)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_trc (Str $name)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_trc_gamma (gdouble $gamma)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_type (Str $name)
  returns Babl
  is native(babl)
  is export
{ * }

sub babl_type_new (Pointer $first_arg, ...)
  returns Babl
  is native(babl)
  is export
{ * }
