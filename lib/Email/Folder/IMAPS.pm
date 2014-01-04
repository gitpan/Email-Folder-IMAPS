use strict;
use warnings;
package Email::Folder::IMAPS;
{
  $Email::Folder::IMAPS::VERSION = '1.104';
}
# ABSTRACT: Email::Folder Access to IMAP over SSL Folders

use Email::Folder::IMAP 1.102 ();   # _imap_class;
use parent qw[Email::Folder::IMAP]; # Argh, no version specifier!
use Net::IMAP::Simple::SSL 1.3;     # :port

sub _imap_class { 'Net::IMAP::Simple::SSL' }

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Email::Folder::IMAPS - Email::Folder Access to IMAP over SSL Folders

=head1 VERSION

version 1.104

=head1 SYNOPSIS

  use Email::Folder;
  use Email::FolderType::Net;
  
  my $folder = Email::Folder->new('imaps://example.com'); # read INBOX
  
  print $_->header('Subject') for $folder->messages;

=head1 DESCRIPTION

This software adds IMAPS functionality to L<Email::Folder|Email::Folder>.
Its interface is identical to the other
L<Email::Folder::Reader|Email::Folder::Reader> subclasses.

=head2 Parameters

C<username> and C<password> parameters may be sent to C<new()>. If
used, they override any user info passed in the connection URI.

=head2 Folder Specification

Folders are specified using a simplified form of the IMAP URL Scheme
detailed in RFC 2192. Not all of that specification applies. Here
are a few examples.

Selecting the INBOX.

  imaps://foo.com

Selecting the INBOX using URI based authentication. Remember that the
C<username> and C<password> parameters passed to C<new()> will override
anything set in the URI.

  imaps://user:pass@foo.com

Selecting the p5p list.

  imaps://foo.com/perl/perl5-porters

=head1 SEE ALSO

L<Email::Folder>,
L<Email::Folder::Reader>,
L<Email::Folder::IMAP>,
L<Email::FolderType::Net>,
L<URI::imaps>,
L<Net::IMAP::Simple::SSL>.

=head1 AUTHOR

Casey West <casey@geeknest.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2004 by Casey West <casey@geeknest.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
