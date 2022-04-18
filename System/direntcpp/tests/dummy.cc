
#include "direntcpp.hh"

#include <iostream>

#include "cxxc.hh"


CXXC_TEST(SimpleTest)
{
	direntcpp::dir dir("/dev");

	while(const direntcpp::entry *entry = dir.readdir())
	{
        if(entry->type() == direntcpp::DIRENT_DIR)
            std::cout << entry->name() << std::endl;
	}
}


CXXC_TEST(NonExistingPath)
{
    direntcpp::dir dir;

    CXXC_CHECK_THROW(std::runtime_error, dir.opendir("/not/exists"));
}


CXXC_MAIN_ENTRY


//
// Local Variables:
// mode: C++
// c-file-style: "bsd"
// c-basic-offset: 4
// indent-tabs-mode: nil
// End:
//
