module Reiser4Probe
  REISER4_MASTER_OFFSET = 65536
  REISER4_MAGIC_OFFSET  = REISER4_MASTER_OFFSET
  REISER4_MAGIC_SIZE    = 10
  REISER4_MAGIC         = "ReIsEr4".freeze

  def self.probe(dobj)
    return(false) unless dobj.kind_of?(MiqDisk)

    # Assume Reiser4 - read magic at offset.
    dobj.seek(REISER4_MAGIC_OFFSET)
    magic = dobj.read(REISER4_MAGIC_SIZE)&.strip
    raise "Reiser4 is Not Supported" if magic == REISER4_MAGIC

    # No Reiser4.
    false
  end
end
