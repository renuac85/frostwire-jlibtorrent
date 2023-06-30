%module (jniclassname="libtorrent_jni", directors="1") libtorrent

// suppress Warning 317: Specialization of non-template '<name>'.
//#pragma SWIG nowarn=317
// suppress Warning 341: The 'using' keyword in type aliasing is not fully supported yet.
//#pragma SWIG nowarn=341
// suppress Warning 401: Nothing known about base class '<name>'. Ignored.
//#pragma SWIG nowarn=401
// supress Warning 402: Base class '<name>' is incomplete.
//#pragma SWIG nowarn=402
// Overloaded method <name> ignored, using <name> instead.
#pragma SWIG nowarn=516
// Specialization of non-template '<name>'.
#pragma SWIG nowarn=317
	
%{
// BEGIN common set include ------------------------------------------------------
#include "libtorrent/version.hpp"
#include "libtorrent/error_code.hpp"
#include "libtorrent/peer_request.hpp"
#include "libtorrent/file_storage.hpp"
#include "libtorrent/bdecode.hpp"
#include "libtorrent/bencode.hpp"
#include "libtorrent/peer_info.hpp"
#include "libtorrent/torrent_flags.hpp"
#include "libtorrent/torrent_info.hpp"
#include "libtorrent/pex_flags.hpp"
#include "libtorrent/torrent_status.hpp"
#include "libtorrent/torrent_handle.hpp"
#include "libtorrent/add_torrent_params.hpp"
#include "libtorrent/operations.hpp"
#include "libtorrent/session_stats.hpp"
#include "libtorrent/close_reason.hpp"
#include "libtorrent/alert.hpp"
#include "libtorrent/alert_types.hpp"
#include "libtorrent/session_settings.hpp"
#include "libtorrent/settings_pack.hpp"
#include "libtorrent/peer_class.hpp"
#include "libtorrent/peer_class_type_filter.hpp"
#include "libtorrent/session_types.hpp"
#include "libtorrent/ip_filter.hpp"
#include "libtorrent/session_handle.hpp"
#include "libtorrent/kademlia/dht_state.hpp"
#include "libtorrent/kademlia/dht_settings.hpp"
#include "libtorrent/session.hpp"
#include "libtorrent/peer_connection_handle.hpp"
#include "libtorrent/magnet_uri.hpp"
#include "libtorrent/create_torrent.hpp"
#include "libtorrent/fingerprint.hpp"

#include "libtorrent.h"

using piece_index_t = libtorrent::piece_index_t;
using file_index_t = libtorrent::file_index_t;
using peer_class_t = libtorrent::peer_class_t;
using port_mapping_t = libtorrent::port_mapping_t;
using queue_position_t = libtorrent::queue_position_t;
using download_priority_t = libtorrent::download_priority_t;
using disconnect_severity_t = libtorrent::disconnect_severity_t;

// END common set include ------------------------------------------------------
%}

%include "includes/libtorrent_java.i"

%include <stdint.i>
%include <typemaps.i>
%include <std_common.i> // maybe remove this one
%include <std_string.i>
%include <std_pair.i>
%include <std_vector.i>
%include <std_map.i>
%include <std_array.i>

%include "boost/boost_map.i"

%apply std::int8_t { char };
%apply std::int64_t { void* };
%apply std::int64_t { std::ptrdiff_t };
%apply std::int64_t { std::time_t };

%define TYPE_INTEGRAL_CONVERSION_EX(name, underlying_type, api_type, java_type)

// don't add deprecated finalize() methods
%typemap(javafinalize) SWIGTYPE ""

%typemap(jni) name, const name& "java_type"
%typemap(jtype) name, const name& "java_type"
%typemap(jstype) name, const name& "java_type"

%typemap(in) name {
    $1 = name(static_cast<underlying_type>($input));
}
%typemap(out) name {
    $result = static_cast<api_type>(static_cast<underlying_type>($1));
}
%typemap(javain) name, const name& "$javainput"
%typemap(javaout) name, const name& {
    return $jnicall;
  }
%enddef

%define TYPE_INTEGRAL_CONVERSION(name, underlying_type, java_type)
TYPE_INTEGRAL_CONVERSION_EX(name, underlying_type, underlying_type, java_type)
%enddef

TYPE_INTEGRAL_CONVERSION(piece_index_t, std::int32_t, int)
TYPE_INTEGRAL_CONVERSION(file_index_t, std::int32_t, int)
TYPE_INTEGRAL_CONVERSION_EX(peer_class_t, std::uint32_t, std::int32_t, int)
TYPE_INTEGRAL_CONVERSION(port_mapping_t, int, int)
TYPE_INTEGRAL_CONVERSION(queue_position_t, int, int)
TYPE_INTEGRAL_CONVERSION(disconnect_severity_t, std::uint8_t, int)

%include "includes/std_vector.i"
%include "includes/std_map.i"
%include "includes/std_bitset.i"
%include "includes/std_swig_templates.i"
%include "includes/libtorrent_flags_bitfield_flag.i"
%include "includes/libtorrent_structs.i"
%include "includes/libtorrent_sha1_hash_type_aliases.i"
%include "includes/libtorrent_storage_mode_t.i"
%include "includes/libtorrent_move_flags_t.i"
%include "includes/libtorrent_connection_type.i"
%include "includes/libtorrent_portmap_transport.i"
%include "includes/libtorrent_portmap_protocol.i"
%include "includes/libtorrent_span.i"
%include "includes/libtorrent_sha1_hash.i"
%include "includes/libtorrent_bloom_filter.i"
%include "includes/libtorrent_string_view.i"
%include "includes/libtorrent_address.i"
%include "includes/libtorrent_tcp_endpoint.i"
%include "includes/libtorrent_udp_endpoint.i"
%include "includes/libtorrent_entry.i"
%include "includes/libtorrent_typed_bitfield.i"
%include "includes/libtorrent_peer_class_info.i"
%include "includes/libtorrent_peer_info.i"
%include "includes/libtorrent_announce.i"
%include "includes/libtorrent_torrent_handle.i"

%ignore libtorrent::TORRENT_CFG;
%ignore libtorrent::detail;
%ignore libtorrent::aux;
%ignore libtorrent::parse_int;
%ignore libtorrent::bdecode;
%ignore libtorrent::get_bdecode_category;
%ignore libtorrent::set_piece_hashes(create_torrent&, std::string const&, std::function<void(piece_index_t)> const&, error_code&);
%ignore libtorrent::hash_value;
%ignore libtorrent::internal_file_entry;
%ignore libtorrent::print_entry;
%ignore libtorrent::fingerprint;
%ignore libtorrent::generate_fingerprint(std::string, int, int, int);
%ignore libtorrent::generate_fingerprint(std::string, int, int);
%ignore libtorrent::generate_fingerprint(std::string, int);
%ignore libtorrent::add_files(file_storage&, std::string const&, std::function<bool(std::string)>, create_flags_t);
%ignore libtorrent::add_files(file_storage&, std::string const&, std::function<bool(std::string)>);
%ignore libtorrent::parse_magnet_uri;
%ignore libtorrent::ip_filter::export_filter;
%ignore libtorrent::add_torrent_params::add_torrent_params;
%ignore libtorrent::add_torrent_params::extensions;
%ignore libtorrent::add_torrent_params::storage;
%ignore libtorrent::add_torrent_params::userdata;
%ignore libtorrent::add_torrent_params::ti;
%ignore libtorrent::add_torrent_params::unfinished_pieces;
%ignore libtorrent::add_torrent_params::renamed_files;
%ignore libtorrent::add_torrent_params::tracker_tiers;
%ignore libtorrent::add_torrent_params::merkle_tree;
%ignore libtorrent::add_torrent_params::banned_peers;
%ignore libtorrent::add_torrent_params::peers;
%ignore libtorrent::add_torrent_params::file_priorities;
%ignore libtorrent::add_torrent_params::dht_nodes;
%ignore libtorrent::add_torrent_params::http_seeds;
%ignore libtorrent::add_torrent_params::url_seeds;
%ignore libtorrent::add_torrent_params::trackers;
%ignore libtorrent::add_torrent_params::piece_priorities;
%ignore libtorrent::add_torrent_params::deprecated1;
%ignore libtorrent::add_torrent_params::deprecated2;
%ignore libtorrent::add_torrent_params::deprecated3;
%ignore libtorrent::add_torrent_params::deprecated4;
%ignore libtorrent::add_torrent_params::deprecated5;
%ignore libtorrent::alert::timestamp;
%ignore libtorrent::performance_alert::bittyrant_with_no_uplimit;
%ignore libtorrent::performance_alert::deprecated_bittyrant_with_no_uplimit;
%ignore libtorrent::performance_alert::performance_warning_t::bittyrant_with_no_uplimit;
%ignore libtorrent::session_params::session_params(settings_pack&&, std::vector<std::shared_ptr<plugin>>);
%ignore libtorrent::session_params::session_params(settings_pack const&, std::vector<std::shared_ptr<plugin>>);
%ignore libtorrent::session_params::session_params(session_params&&);
%ignore libtorrent::session_params::session_params(settings_pack&& sp);
%ignore libtorrent::session_params::extensions;
%ignore libtorrent::session_params::dht_storage_constructor;
%ignore libtorrent::session::session(session_params&&, io_service&);
%ignore libtorrent::session::session(session_params const&, io_service&);
%ignore libtorrent::session::session(settings_pack&&, io_service&, session_flags_t const);
%ignore libtorrent::session::session(settings_pack const&, io_service&, session_flags_t const);
%ignore libtorrent::session::session(settings_pack&&, io_service&);
%ignore libtorrent::session::session(settings_pack const&, io_service&);
%ignore libtorrent::session::session(session_params&&);
%ignore libtorrent::session::session(settings_pack&&, session_flags_t const);
%ignore libtorrent::session::session(settings_pack&&);
%ignore libtorrent::session_proxy::session_proxy(session_proxy&&);
%ignore libtorrent::session_handle::session_handle(aux::session_impl*);
%ignore libtorrent::session_handle::session_handle(session_handle&&);
%ignore libtorrent::session_handle::get_torrent_status;
%ignore libtorrent::session_handle::get_io_service;
%ignore libtorrent::session_handle::get_connection_queue;
%ignore libtorrent::session_handle::add_extension(std::function<std::shared_ptr<torrent_plugin>(torrent_handle const&, void*)>);
%ignore libtorrent::session_handle::add_extension(std::shared_ptr<plugin>);
%ignore libtorrent::session_handle::dht_put_item(std::array<char, 32>, std::function<void(entry&, std::array<char,64>&, std::int64_t&, std::string const&)>, std::string);
%ignore libtorrent::session_handle::dht_put_item(std::array<char, 32>, std::function<void(entry&, std::array<char,64>&, std::int64_t&, std::string const&)>);
%ignore libtorrent::session_handle::dht_get_item(std::array<char, 32>, std::string);
%ignore libtorrent::session_handle::dht_get_item(std::array<char, 32>);
%ignore libtorrent::session_handle::dht_direct_request(udp::endpoint const&, entry const&, void*);
%ignore libtorrent::session_handle::set_load_function;
%ignore libtorrent::session_handle::set_alert_notify;
%ignore libtorrent::session_handle::native_handle;
%ignore libtorrent::session_handle::set_dht_storage;
%ignore libtorrent::session_handle::get_cache_info;
%ignore libtorrent::session_handle::wait_for_alert;
%ignore libtorrent::session_handle::add_default_plugins;
%ignore libtorrent::session_handle::add_torrent(add_torrent_params&&, error_code&);
%ignore libtorrent::session_handle::async_add_torrent(add_torrent_params&&);
%ignore libtorrent::session_handle::apply_settings(settings_pack&&);
%ignore libtorrent::session_stats_alert::counters;
%ignore libtorrent::picker_log_alert::blocks;
%ignore libtorrent::peer_connection_handle::peer_connection_handle;
%ignore libtorrent::peer_connection_handle::native_handle;
%ignore libtorrent::peer_connection_handle::add_extension;
%ignore libtorrent::peer_connection_handle::find_plugin;
%ignore libtorrent::peer_connection_handle::time_of_last_unchoke;
%ignore libtorrent::peer_connection_handle::should_log;
%ignore libtorrent::peer_connection_handle::peer_log;
%ignore libtorrent::bt_peer_connection_handle::switch_send_crypto;
%ignore libtorrent::bt_peer_connection_handle::switch_recv_crypto;
%ignore libtorrent::bt_peer_connection_handle::native_handle;
%ignore libtorrent::block_info::set_peer;
%ignore libtorrent::partial_piece_info::blocks;
%ignore libtorrent::partial_piece_info::deprecated_state_t;
%ignore libtorrent::partial_piece_info::deprecated_piece_state;
%ignore libtorrent::stats_alert::transferred;
%ignore libtorrent::stats_alert::deprecated1;
%ignore libtorrent::stats_alert::deprecated2;
%ignore libtorrent::stats_alert::deprecated3;
%ignore libtorrent::stats_alert::deprecated4;
%ignore libtorrent::dht_mutable_item_alert::dht_mutable_item_alert;
%ignore libtorrent::dht_mutable_item_alert::key;
%ignore libtorrent::dht_mutable_item_alert::signature;
%ignore libtorrent::dht_mutable_item_alert::seq;
%ignore libtorrent::dht_mutable_item_alert::salt;
%ignore libtorrent::dht_put_alert::dht_put_alert;
%ignore libtorrent::dht_put_alert::public_key;
%ignore libtorrent::dht_put_alert::signature;
%ignore libtorrent::dht_put_alert::salt;
%ignore libtorrent::dht_put_alert::seq;
%ignore libtorrent::dht_direct_response_alert::dht_direct_response_alert;
%ignore libtorrent::dht_direct_response_alert::userdata;
%ignore libtorrent::from_span;
%ignore libtorrent::from_span_t;
%ignore libtorrent::torrent_info::torrent_info(char const*, int, error_code&);
%ignore libtorrent::torrent_info::torrent_info(char const*, int, error_code&, int);
%ignore libtorrent::torrent_info::torrent_info(span<char const>, error_code&, from_span_t);
%ignore libtorrent::torrent_info::metadata;
%ignore libtorrent::torrent_info::load;
%ignore libtorrent::torrent_info::unload;
%ignore libtorrent::torrent_info::hash_for_piece_ptr;
%ignore libtorrent::torrent_info::parse_info_section;
%ignore libtorrent::torrent_info::swap;
%ignore libtorrent::torrent_info::add_merkle_nodes;
%ignore libtorrent::torrent_info::build_merkle_list;
%ignore libtorrent::torrent_info::parse_torrent_file;
%ignore libtorrent::torrent_info::piece_range;
%ignore libtorrent::sanitize_append_path_element;
%ignore libtorrent::verify_encoding;
%ignore libtorrent::read_piece_alert::read_piece_alert;
%ignore libtorrent::read_piece_alert::buffer;
%ignore libtorrent::bdecode_node::bdecode_node(bdecode_node&&);
%ignore libtorrent::bdecode_node::non_owning;
%ignore libtorrent::bdecode_node::data_section;
%ignore libtorrent::bdecode_node::list_string_value_at;
%ignore libtorrent::bdecode_node::dict_find;
%ignore libtorrent::bdecode_node::dict_find_dict;
%ignore libtorrent::bdecode_node::dict_find_list;
%ignore libtorrent::bdecode_node::dict_find_string;
%ignore libtorrent::bdecode_node::dict_find_int;
%ignore libtorrent::bdecode_node::dict_find_string_value;
%ignore libtorrent::bdecode_node::dict_find_int_value;
%ignore libtorrent::bdecode_node::string_value;
%ignore libtorrent::bdecode_node::string_ptr;
%ignore libtorrent::bdecode_node::swap;
%ignore libtorrent::bdecode_node::reserve;
%ignore libtorrent::bdecode_node::switch_underlying_buffer;
%ignore libtorrent::bdecode_node::has_soft_error;
%ignore libtorrent::errors::make_error_code;
%ignore libtorrent::bdecode_errors::make_error_code;
%ignore libtorrent::apply_pack;
%ignore libtorrent::apply_pack_impl;
%ignore libtorrent::load_pack_from_dict;
%ignore libtorrent::save_settings_to_dict;
%ignore libtorrent::run_all_updates;
%ignore libtorrent::error_code;
%ignore libtorrent::settings_pack::settings_pack(settings_pack&&);
%ignore libtorrent::settings_pack::deprecated;
%ignore libtorrent::settings_pack::deprecated_ignore_limits_on_local_network;
%ignore libtorrent::settings_pack::deprecated_rate_limit_utp;
%ignore libtorrent::settings_pack::deprecated_local_upload_rate_limit;
%ignore libtorrent::settings_pack::deprecated_local_download_rate_limit;
%ignore libtorrent::settings_pack::deprecated_half_open_limit;
%ignore libtorrent::settings_pack::deprecated_utp_delayed_ack;
%ignore libtorrent::settings_pack::deprecated_ignore_resume_timestamps;
%ignore libtorrent::settings_pack::deprecated_network_threads;
%ignore libtorrent::settings_pack::deprecated_lock_disk_cache;
%ignore libtorrent::settings_pack::deprecated_use_write_cache;
%ignore libtorrent::settings_pack::deprecated_lazy_bitfield;
%ignore libtorrent::settings_pack::deprecated_guided_read_cache;
%ignore libtorrent::settings_pack::deprecated_hashing_threads;
%ignore libtorrent::settings_pack::deprecated_contiguous_recv_buffer;
%ignore libtorrent::settings_pack::deprecated_default_cache_min_age;
%ignore libtorrent::settings_pack::deprecated_low_prio_disk;
%ignore libtorrent::settings_pack::deprecated_announce_double_nat;
%ignore libtorrent::settings_pack::deprecated_use_disk_read_ahead;
%ignore libtorrent::settings_pack::deprecated_active_loaded_limit;
%ignore libtorrent::settings_pack::deprecated_mmap_cache;
%ignore libtorrent::settings_pack::deprecated_dont_flush_write_cache;
%ignore libtorrent::settings_pack::deprecated_file_checks_delay_per_block;
%ignore libtorrent::settings_pack::deprecated_use_disk_cache_pool;
%ignore libtorrent::settings_pack::deprecated_cache_buffer_chunk_size;
%ignore libtorrent::settings_pack::deprecated_lock_files;
%ignore libtorrent::settings_pack::deprecated_ssl_listen;
%ignore libtorrent::settings_pack::deprecated_force_proxy;
%ignore libtorrent::settings_pack::deprecated_broadcast_lsd;
%ignore libtorrent::settings_pack::deprecated_upnp_ignore_nonrouters;
%ignore libtorrent::settings_pack::deprecated_bittyrant_choker;
%ignore libtorrent::settings_pack::bittyrant_choker;
%ignore libtorrent::storage_params::pool;
%ignore libtorrent::storage_params::priorities;
%ignore libtorrent::ipv6_peer::addr;
%ignore libtorrent::proxy_settings::proxy_settings;
%ignore libtorrent::torrent_status::torrent_status(torrent_status&&);
%ignore libtorrent::torrent_status::allocating;
%ignore libtorrent::torrent_status::unused_enum_for_backwards_compatibility_allocating;
%ignore libtorrent::torrent_status::_dummy_string_;
%ignore libtorrent::torrent_status::torrent_file;
%ignore libtorrent::torrent_status::next_announce;
%ignore libtorrent::torrent_status::deprecated_announce_interval_;
%ignore libtorrent::torrent_status::deprecated_priority;
%ignore libtorrent::torrent_status::unused_enum_for_backwards_compatibility;
%ignore libtorrent::torrent_status::deprecated_is_loaded;
%ignore libtorrent::torrent_status::last_upload;
%ignore libtorrent::torrent_status::last_download;
%ignore libtorrent::torrent_status::active_duration;
%ignore libtorrent::torrent_status::finished_duration;
%ignore libtorrent::torrent_status::seeding_duration;
%ignore libtorrent::torrent_status::queue_position;
%ignore libtorrent::torrent_status::deprecated_time_since_upload;
%ignore libtorrent::torrent_status::deprecated_time_since_download;
%ignore libtorrent::torrent_status::deprecated_active_time;
%ignore libtorrent::torrent_status::deprecated_finished_time;
%ignore libtorrent::torrent_status::deprecated_seeding_time;
%ignore libtorrent::torrent_status::deprecated_last_scrape;
%ignore libtorrent::torrent_status::deprecated_ip_filter_applies;
%ignore libtorrent::torrent_status::deprecated_upload_mode;
%ignore libtorrent::torrent_status::deprecated_share_mode;
%ignore libtorrent::torrent_status::deprecated_super_seeding;
%ignore libtorrent::torrent_status::deprecated_paused;
%ignore libtorrent::torrent_status::deprecated_auto_managed;
%ignore libtorrent::torrent_status::deprecated_sequential_download;
%ignore libtorrent::torrent_status::deprecated_seed_mode;
%ignore libtorrent::torrent_status::deprecated_stop_when_ready;
%ignore libtorrent::file_storage::file_storage(file_storage&&);
%ignore libtorrent::file_storage::file_path_hash;
%ignore libtorrent::file_storage::all_path_hashes;
%ignore libtorrent::file_storage::file_name_ptr;
%ignore libtorrent::file_storage::file_name_len;
%ignore libtorrent::file_storage::apply_pointer_offset;
%ignore libtorrent::file_storage::add_file(std::string const&, std::int64_t, std::uint32_t, std::time_t, string_view);
%ignore libtorrent::file_storage::file_range;
%ignore libtorrent::file_storage::piece_range;
%ignore libtorrent::torrent_info::internal_set_creator;
%ignore libtorrent::torrent_info::internal_set_creation_date;
%ignore libtorrent::torrent_info::internal_set_comment;
%ignore libtorrent::file_storage::sanitize_symlinks;
%ignore libtorrent::create_torrent::add_url_seed(string_view);
%ignore libtorrent::create_torrent::add_http_seed(string_view);
%ignore libtorrent::create_torrent::add_tracker(string_view);
%ignore libtorrent::create_torrent::add_tracker(string_view, int);
%ignore libtorrent::create_torrent::add_collection(string_view);
%ignore libtorrent::create_torrent::set_root_cert;
%ignore libtorrent::get_file_attributes;
%ignore libtorrent::get_symlink_path;
%ignore libtorrent::stats_metric::name;
%ignore libtorrent::peer_log_alert::event_type;
%ignore libtorrent::dht_lookup::type;
%ignore libtorrent::error_to_close_reason;
%ignore libtorrent::storage_error;
%ignore libtorrent::user_alert_id;
%ignore libtorrent::bdecode_category;
%ignore libtorrent::http_category;
%ignore libtorrent::libtorrent_category;
%ignore libtorrent::dht_announce_alert::ip;
%ignore libtorrent::external_ip_alert::external_address;
%ignore libtorrent::listen_failed_alert::address;
%ignore libtorrent::listen_succeeded_alert::address;
%ignore libtorrent::incoming_connection_alert::endpoint;
%ignore libtorrent::peer_alert::endpoint;
%ignore libtorrent::dht_direct_response_alert::endpoint;
%ignore libtorrent::dht_outgoing_get_peers_alert::endpoint;
%ignore libtorrent::dht_pkt_alert::node;
%ignore libtorrent::udp_error_alert::endpoint;
%ignore libtorrent::dht_sample_infohashes_alert::endpoint;
%ignore libtorrent::dht_sample_infohashes_alert::interval;
%ignore libtorrent::tracker_alert::local_endpoint;
%ignore libtorrent::dht::extract_node_ids;
%ignore libtorrent::dht::read_dht_state;
%ignore libtorrent::dht::save_dht_state;
%ignore libtorrent::dht::read_dht_settings;
%ignore libtorrent::dht::save_dht_settings;
%ignore libtorrent::find_metric_idx;

%ignore libtorrent::errors::deprecated_120;
%ignore libtorrent::errors::deprecated_121;
%ignore libtorrent::errors::deprecated_122;
%ignore libtorrent::errors::deprecated_123;
%ignore libtorrent::errors::deprecated_124;

%ignore boost::throws;
%ignore boost::detail::throws;
%ignore boost::system::generic_category;
%ignore boost::system::system_category;
%ignore boost::system::error_category;
%ignore boost::system::error_condition;
%ignore boost::system::system_error;
%ignore boost::system::error_code::error_code(int, const error_category&);
%ignore boost::system::error_code::assign;
%ignore boost::system::error_code::category;
%ignore boost::system::error_code::default_error_condition;
%ignore boost::system::error_code::unspecified_bool_true;
%ignore boost::system::error_code::operator std::error_code;
%ignore boost::system::operator==(const error_code&, const error_condition&);
%ignore boost::system::operator==(const error_condition&, const error_code&);
%ignore boost::system::operator!=(const error_code&, const error_condition&);
%ignore boost::system::operator!=(const error_condition&, const error_code&);
%ignore boost::system::operator!=(const error_condition&, const error_condition&);
%ignore boost::system::hash_value;
%ignore boost::system::errc::make_error_condition;
%ignore boost::asio;

%ignore operator=;
%ignore operator!;
%ignore operator++;
%ignore operator--;
%ignore operator+=;
%ignore operator<<=;
%ignore operator>>=;
%ignore operator~;
%ignore operator^;
%ignore operator^=;
%ignore operator&;
%ignore operator&=;
%ignore operator|=;
%ignore operator int;
%ignore operator();
%ignore operator<<;
%ignore operator>>;
%ignore operator[];
%ignore operator unspecified_bool_type;

%rename(op_eq) operator==;
%rename(op_ne) operator!=;
%rename(op_lt) operator<;
%rename(op_gt) operator>;
%rename(op_lte) operator<=;
%rename(op_gte) operator>=;
%rename(op_bool) operator bool;

%rename(libtorrent_no_error) libtorrent::errors::no_error;
%rename(libtorrent_errors) libtorrent::errors::error_code_enum;
%rename(bdecode_no_error) libtorrent::bdecode_errors::no_error;
%rename(bdecode_errors) libtorrent::bdecode_errors::error_code_enum;

%rename("$ignore", regextarget=1, %$isconstructor) ".*_alert$";

%ignore dht_put_item_cb;

%feature("director") add_files_listener;
%feature("director") set_piece_hashes_listener;

%feature("director") alert_notify_callback;
%feature("director") swig_plugin;
%feature("director") posix_wrapper;

%ignore swig_plugin::implemented_features;
%ignore set_piece_hashes_listener::progress_index;

%include "includes/boost_system_error_code.i"

%ignore WRAP_POSIX;
%ignore get_libc;
%ignore posix_open;
%ignore posix_stat;
%ignore posix_mkdir;
%ignore posix_rename;
%ignore posix_remove;
%ignore ::open;
%ignore ::stat;
%ignore ::mkdir;
%ignore ::rename;
%ignore ::remove;
%ignore g_posix_wrapper;

// BEGIN common set include ------------------------------------------------------

%include <boost/system/error_code.hpp>
%include <boost/system/system_error.hpp>

%include "libtorrent/version.hpp"
%include "libtorrent/error_code.hpp"
%include "libtorrent/peer_request.hpp"
%include "libtorrent/file_storage.hpp"
%include "libtorrent/bdecode.hpp"
%include "libtorrent/bencode.hpp"
%include "libtorrent/peer_info.hpp"
%include "libtorrent/torrent_flags.hpp"
%include "libtorrent/torrent_info.hpp"
%include "libtorrent/pex_flags.hpp"
%include "libtorrent/torrent_status.hpp"
%include "libtorrent/torrent_handle.hpp"
%include "libtorrent/add_torrent_params.hpp"
%include "libtorrent/operations.hpp"
%include "libtorrent/session_stats.hpp"
%include "libtorrent/close_reason.hpp"
%include "libtorrent/alert.hpp"
%include "libtorrent/alert_types.hpp"
%include "libtorrent/session_settings.hpp"
%include "libtorrent/settings_pack.hpp"
%include "libtorrent/peer_class_type_filter.hpp"
%include "libtorrent/session_types.hpp"
%include "libtorrent/ip_filter.hpp"
%include "libtorrent/session_handle.hpp"
%include "libtorrent/kademlia/dht_state.hpp"
%include "libtorrent/kademlia/dht_settings.hpp"
%include "libtorrent/session.hpp"
%include "libtorrent/peer_connection_handle.hpp"
%include "libtorrent/magnet_uri.hpp"
%include "libtorrent/create_torrent.hpp"
%include "libtorrent/fingerprint.hpp"

%include "libtorrent.h"

// END common set include ------------------------------------------------------

%include "libtorrent/libtorrent_alert_casts.i"

%extend alert {


}

%extend session_handle {

    void dht_get_item(std::vector<int8_t>& key, std::vector<int8_t>& salt) {
        if (key.size() != 32) {
            throw std::invalid_argument("Public key must be of size 32");
        }
        std::array<char, 32> pk;
        std::copy_n(key.begin(), 32, pk.begin());

        $self->dht_get_item(pk, std::string(salt.begin(), salt.end()));
    }

    void dht_put_item(std::vector<int8_t>& key, std::vector<int8_t>& sk, entry& data, std::vector<int8_t>& salt) {
        if (key.size() != 32) {
            throw std::invalid_argument("Public key must be of size 32");
        }
        if (sk.size() != 64) {
            throw std::invalid_argument("Private key must be of size 64");
        }
        std::array<char, 32> pk;
        std::copy_n(key.begin(), 32, pk.begin());

        using namespace std::placeholders;
        using namespace libtorrent::dht;

        $self->dht_put_item(pk, std::bind(&dht_put_item_cb, _1, _2, _3, _4,
            public_key((char*)key.data()), secret_key((char*)sk.data()), data),
            std::string(salt.begin(), salt.end()));
    }

    void dht_direct_request(udp::endpoint const& ep, entry const& e, int64_t userdata) {
        $self->dht_direct_request(ep, e, (void*)userdata);
    }

    alert* wait_for_alert_ms(int64_t max_wait) {
        return $self->wait_for_alert(libtorrent::milliseconds(max_wait));
    }

    void set_alert_notify_callback(alert_notify_callback* cb) {
        $self->set_alert_notify(std::bind(&alert_notify_callback::on_alert, cb));
    }

    void add_extension(swig_plugin* ext) {
        $self->add_extension(std::shared_ptr<libtorrent::plugin>(ext));
    }
}

%extend bdecode_node {

    std::string list_string_value_at_s(int i, std::string default_val = "") {
        return $self->list_string_value_at(i, default_val).to_string();
    }

    bdecode_node dict_find_s(std::string key) const {
        return $self->dict_find(key);
    }

    bdecode_node dict_find_dict_s(std::string key) const {
        return $self->dict_find_dict(key);
    }

    bdecode_node dict_find_list_s(std::string key) const {
        return $self->dict_find_list(key);
    }

    bdecode_node dict_find_string_s(std::string key) const {
        return $self->dict_find_string(key);
    }

    bdecode_node dict_find_int_s(std::string key) const {
        return $self->dict_find_int(key);
    }

    std::string dict_find_string_value_s(std::string key, std::string default_value = "") const {
        return $self->dict_find_string_value(key, default_value).to_string();
    }

    std::int64_t dict_find_int_value_s(std::string key, std::int64_t default_val = 0) const {
        return $self->dict_find_int_value(key, default_val);
    }

    std::string string_value_s() const {
        return $self->string_value().to_string();
    }

    static std::string to_string(bdecode_node const& e, bool single_line, int indent) {
        return libtorrent::print_entry(e, single_line, indent);
    }

    static int bdecode(std::vector<int8_t>& buffer, bdecode_node& ret, error_code& ec) {
        return libtorrent::bdecode((char const*)&buffer[0], (char const*)&buffer[0] + buffer.size(), ret, ec);
    }
}

%extend add_torrent_params {

    libtorrent::torrent_info const* ti_ptr() {
        return $self->ti.get();
    }

    void set_ti(libtorrent::torrent_info const& ti) {
        $self->ti = std::make_shared<libtorrent::torrent_info>(ti);
    }

    void set_renamed_files(std::map<file_index_t, std::string> const& renamed_files) {
        $self->renamed_files = renamed_files;
    }

    std::vector<int> get_tracker_tiers() {
        return $self->tracker_tiers;
    }

    void set_tracker_tiers(std::vector<int> const& tracker_tiers) {
        $self->tracker_tiers = tracker_tiers;
    }

    void set_merkle_tree(std::vector<sha1_hash> const& merkle_tree) {
        $self->merkle_tree = merkle_tree;
    }

    std::vector<tcp::endpoint> get_banned_peers() {
        return $self->banned_peers;
    }

    void set_banned_peers(std::vector<tcp::endpoint> const& banned_peers) {
        $self->banned_peers = banned_peers;
    }

    std::vector<tcp::endpoint> get_peers() {
        return $self->peers;
    }

    void set_peers(std::vector<tcp::endpoint> const& peers) {
        $self->peers = peers;
    }

    void set_file_priorities2(std::vector<std::int8_t> const& file_priorities) {
        std::vector<download_priority_t> v(file_priorities.size());
        for (std::size_t i = 0; i < v.size(); i++)
            v[i] = download_priority_t{std::uint8_t(file_priorities[i])};
        $self->file_priorities = v;
    }

    std::vector<std::pair<std::string, int>> get_dht_nodes() {
        return $self->dht_nodes;
    }

    void set_dht_nodes(std::vector<std::pair<std::string, int>> const& dht_nodes) {
        $self->dht_nodes = dht_nodes;
    }

    void set_http_seeds(std::vector<std::string> const& http_seeds) {
        $self->http_seeds = http_seeds;
    }

    std::vector<std::string> get_url_seeds() {
        return $self->url_seeds;
    }

    void set_url_seeds(std::vector<std::string> const& url_seeds) {
        $self->url_seeds = url_seeds;
    }

    std::vector<std::string>  get_trackers() {
        return $self->trackers;
    }

    void set_trackers(std::vector<std::string> const& trackers) {
        $self->trackers = trackers;
    }

    void set_piece_priorities2(std::vector<std::int8_t> const& piece_priorities) {
        std::vector<download_priority_t> v(piece_priorities.size());
        for (std::size_t i = 0; i < v.size(); i++)
            v[i] = download_priority_t{std::uint8_t(piece_priorities[i])};
        $self->piece_priorities = v;
    }

    static libtorrent::add_torrent_params create_instance() {
        return libtorrent::add_torrent_params();
    }

    static libtorrent::add_torrent_params create_instance_disabled_storage() {
        return libtorrent::add_torrent_params(libtorrent::disabled_storage_constructor);
    }

    static libtorrent::add_torrent_params create_instance_zero_storage() {
        return libtorrent::add_torrent_params(libtorrent::zero_storage_constructor);
    }

    void set_default_storage()
    {
        $self->storage = libtorrent::default_storage_constructor;
    }

    void set_disabled_storage()
    {
        $self->storage = libtorrent::disabled_storage_constructor;
    }

    void set_zero_storage()
    {
        $self->storage = libtorrent::zero_storage_constructor;
    }

    static libtorrent::add_torrent_params read_resume_data(libtorrent::bdecode_node const& rd, error_code& ec) {
        return libtorrent::read_resume_data(rd, ec);
    }

    static libtorrent::add_torrent_params read_resume_data(std::vector<int8_t> const& buffer, error_code& ec) {
        return libtorrent::read_resume_data({(char const*)&buffer[0], static_cast<long>(buffer.size())}, ec);
    }

    static libtorrent::entry write_resume_data(add_torrent_params const& atp) {
        return libtorrent::write_resume_data(atp);
    }

    static std::vector<int8_t> write_resume_data_buf(add_torrent_params const& atp) {
        auto v = libtorrent::write_resume_data_buf(atp);
        return {v.begin(), v.end()};
    }

    static add_torrent_params parse_magnet_uri(std::string const& uri, error_code& ec) {
        return libtorrent::parse_magnet_uri(uri, ec);
    }
}

%extend torrent_info {

    torrent_info(int64_t buffer_ptr, int size, error_code& ec) {
        return new libtorrent::torrent_info(reinterpret_cast<char const*>(buffer_ptr), size, ec);
    }
};

%extend torrent_handle {

    void add_piece_bytes(int piece, std::vector<int8_t> const& data, add_piece_flags_t flags = {}) {
        $self->add_piece(piece_index_t(piece), (char const*)&data[0], flags);
    }

    libtorrent::torrent_info const* torrent_file_ptr() {
        return $self->torrent_file().get();
    }

    std::vector<std::string> get_url_seeds() const {
        std::set<std::string> s = $self->url_seeds();
        return {s.begin(), s.end()};
    }

    std::vector<std::string> get_http_seeds() const {
        std::set<std::string> s = $self->http_seeds();
        return {s.begin(), s.end()};
    }

    void set_ssl_certificate_buffer2(std::vector<int8_t> const& certificate
        , std::vector<int8_t> const& private_key
        , std::vector<int8_t> const& dh_params)
    {
        std::string cert{certificate.begin(), certificate.end()};
        std::string pk{private_key.begin(), private_key.end()};
        std::string dh{dh_params.begin(), dh_params.end()};
        $self->set_ssl_certificate_buffer(cert, pk, dh);
    }

    int queue_position2() const
    {
        return static_cast<int>($self->queue_position());
    }

    void queue_position_set2(int p)
    {
        $self->queue_position_set(queue_position_t{p});
    }

    int piece_priority2(piece_index_t index)
    {
        return int(static_cast<std::uint8_t>($self->piece_priority(index)));
    }

    void piece_priority2(piece_index_t index, int priority)
    {
        $self->piece_priority(index, download_priority_t{std::uint8_t(priority)});
    }

    void prioritize_pieces2(std::vector<int> const& pieces)
    {
        std::vector<download_priority_t> v(pieces.size());
        for (std::size_t i = 0; i < v.size(); i++)
            v[i] = download_priority_t{std::uint8_t(pieces[i])};
        $self->prioritize_pieces(v);
    }

    void prioritize_pieces2(std::vector<std::pair<piece_index_t, int>> const& pieces)
    {
        std::vector<std::pair<piece_index_t, download_priority_t>> v(pieces.size());
        for (std::size_t i = 0; i < v.size(); i++)
            v[i] = std::pair<piece_index_t, download_priority_t>(pieces[i].first, download_priority_t{std::uint8_t(pieces[i].second)});
        $self->prioritize_pieces(v);
    }

    std::vector<int> get_piece_priorities2() const
    {
        std::vector<download_priority_t> v = $self->get_piece_priorities();
        std::vector<int> r(v.size());
        for (std::size_t i = 0; i < v.size(); i++)
            r[i] = int(static_cast<std::uint8_t>(v[i]));
        return r;
    }

    int file_priority2(file_index_t index)
    {
        return int(static_cast<std::uint8_t>($self->file_priority(index)));
    }

    void file_priority2(file_index_t index, int priority)
    {
        $self->file_priority(index, download_priority_t{std::uint8_t(priority)});
    }

    void prioritize_files2(std::vector<int> const& files)
    {
        std::vector<download_priority_t> v(files.size());
        for (std::size_t i = 0; i < v.size(); i++)
            v[i] = download_priority_t{std::uint8_t(files[i])};
        $self->prioritize_files(v);
    }

    std::vector<int> get_file_priorities2() const
    {
        std::vector<download_priority_t> v = $self->get_file_priorities();
        std::vector<int> r(v.size());
        for (std::size_t i = 0; i < v.size(); i++)
            r[i] = int(static_cast<std::uint8_t>(v[i]));
        return r;
    }
}

%extend dht_mutable_item_alert {

    std::vector<int8_t> get_key() {
        std::array<char, 32> arr = $self->key;
        return std::vector<int8_t>(arr.begin(), arr.end());
    }

    std::vector<int8_t> get_signature() {
        std::array<char, 64> arr = $self->signature;
        return std::vector<int8_t>(arr.begin(), arr.end());
    }

    int64_t get_seq() {
        return int64_t($self->seq);
    }

    std::vector<int8_t> get_salt() {
        std::string s = $self->salt;
        return std::vector<int8_t>(s.begin(), s.end());
    }
}

%extend dht_put_alert {

    std::vector<int8_t> get_public_key() {
        std::array<char, 32> arr = $self->public_key;
        return std::vector<int8_t>(arr.begin(), arr.end());
    }

    std::vector<int8_t> get_signature() {
        std::array<char, 64> arr = $self->signature;
        return std::vector<int8_t>(arr.begin(), arr.end());
    }

    std::vector<int8_t> get_salt() {
        std::string s = $self->salt;
        return std::vector<int8_t>(s.begin(), s.end());
    }

    int64_t get_seq() {
        return int64_t($self->seq);
    }
}

%extend stats_alert {
    int get_transferred(int index) {
        return $self->transferred[index];
    }
}

%extend session_stats_alert {
    long long get_value(int index) {
        return $self->counters()[index];
    }
}

%extend read_piece_alert {

    int64_t buffer_ptr() {
        return reinterpret_cast<int64_t>($self->buffer.get());
    }
}

%extend peer_connection_handle {

    int64_t get_time_of_last_unchoke() {
        return libtorrent::total_milliseconds($self->time_of_last_unchoke() - libtorrent::clock_type::now());
    }
};

%extend torrent_status {

    torrent_info const* torrent_file_ptr() {
        return $self->torrent_file.lock().get();
    }

    int64_t get_next_announce() {
        return libtorrent::total_milliseconds($self->next_announce);
    }

    int64_t get_last_upload() {
        return libtorrent::total_milliseconds($self->last_upload.time_since_epoch());
    }

    int64_t get_last_download() {
        return libtorrent::total_milliseconds($self->last_download.time_since_epoch());
    }

    int64_t get_active_duration() {
        return libtorrent::total_milliseconds($self->active_duration);
    }

    int64_t get_finished_duration() {
        return libtorrent::total_milliseconds($self->finished_duration);
    }

    int64_t get_seeding_duration() {
        return libtorrent::total_milliseconds($self->seeding_duration);
    }

    int get_queue_position()
    {
        return static_cast<int>($self->queue_position);
    }
}

%extend stats_metric {
    std::string get_name() {
        return std::string($self->name);
    }
}

%extend peer_log_alert {
    std::string get_event_type() {
        return std::string($self->event_type);
    }
}

%extend dht_lookup {

    std::string get_type() {
        return std::string($self->type);
    }
}

%extend dht_direct_response_alert {

    int64_t get_userdata() {
        return (int64_t)$self->userdata;
    }
}

%extend create_torrent {

    void add_url_seed(std::string const& url) {
        $self->add_url_seed(url);
    }

    void add_http_seed(std::string const& url) {
        $self->add_http_seed(url);
    }

    void add_tracker(std::string const& url, int tier) {
        $self->add_tracker(url, tier);
    }

    void add_collection(std::string const& c) {
        $self->add_collection(c);
    }

    void set_root_cert2(std::vector<int8_t> const& pem)
    {
        std::string s{pem.begin(), pem.end()};
        $self->set_root_cert(s);
    }
}

%extend file_storage {

    void add_file(std::string const& path, std::int64_t file_size,
        libtorrent::file_flags_t file_flags, std::time_t mtime, std::string const& symlink_path) {
        $self->add_file(path, file_size, file_flags, mtime, symlink_path);
    }
}

%extend dht_announce_alert {

    address get_ip() {
        return $self->ip;
    }
}

%extend external_ip_alert {

    address get_external_address() {
        return $self->external_address;
    }
}

%extend listen_failed_alert {

    address get_address() {
        return $self->address;
    }
}

%extend listen_succeeded_alert {

    address get_address() {
        return $self->address;
    }
}

%extend incoming_connection_alert {

    tcp::endpoint get_endpoint() {
        return $self->endpoint;
    }
}

%extend peer_alert {

    tcp::endpoint get_endpoint() {
        return $self->endpoint;
    }
}

%extend dht_direct_response_alert {

    udp::endpoint get_endpoint() {
        return $self->endpoint;
    }
}

%extend dht_outgoing_get_peers_alert {

    udp::endpoint get_endpoint() {
        return $self->endpoint;
    }
}

%extend dht_pkt_alert {

    udp::endpoint get_node() {
        return $self->node;
    }
}

%extend udp_error_alert {

    udp::endpoint get_endpoint() {
        return $self->endpoint;
    }
}

%extend dht_sample_infohashes_alert {

    udp::endpoint get_endpoint() {
        return $self->endpoint;
    }

    std::int64_t get_interval() {
        return libtorrent::total_milliseconds($self->interval);
    }
}

%extend tracker_alert {

    tcp::endpoint get_local_endpoint() {
        return $self->local_endpoint;
    }
}

}
